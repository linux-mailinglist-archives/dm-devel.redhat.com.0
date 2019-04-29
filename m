Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C7D1F85B
	for <lists+dm-devel@lfdr.de>; Wed, 15 May 2019 18:19:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33B8330018D7;
	Wed, 15 May 2019 16:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 095DB608BB;
	Wed, 15 May 2019 16:19:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 967BD18089CB;
	Wed, 15 May 2019 16:19:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FGIwWb024317 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 12:18:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7646C87DD; Wed, 15 May 2019 16:18:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF952601B3;
	Wed, 15 May 2019 16:18:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4FGIl24018094; 
	Wed, 15 May 2019 11:18:54 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x3TLccYT000544;
	Mon, 29 Apr 2019 16:38:38 -0500
Date: Mon, 29 Apr 2019 16:38:38 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20190429213837.GC5210@octiron.msp.redhat.com>
References: <20190424090759.29796-1-mwilck@suse.com>
	<fa3ea599bf6424587fec45b5eb3549b3200ac5e9.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa3ea599bf6424587fec45b5eb3549b3200ac5e9.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2] multipath -u: test socket connection in
 non-blocking mode
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 15 May 2019 16:19:12 +0000 (UTC)

On Thu, Apr 25, 2019 at 09:33:03PM +0200, Martin Wilck wrote:
> On Wed, 2019-04-24 at 11:07 +0200, Martin Wilck wrote:
> > Since commit d7188fcd "multipathd: start daemon after udev trigger",
> > multipathd startup is delayed during boot until after "udev settle"
> > terminates. But "multipath -u" is run by udev workers for storage
> > devices,
> > and attempts to connect to the multipathd socket. This causes a start
> > job
> > for multipathd to be scheduled by systemd, but that job won't be
> > started
> > until "udev settle" finishes. This is not a problem on systems with
> > 129 or
> > less storage units, because the connect() call of "multipath -u" will
> > succeed anyway. But on larger systems, the listen backlog of the
> > systemd
> > socket can be exceeded, which causes connect() calls for the socket
> > to
> > block until multipathd starts up and begins calling accept(). This
> > creates
> > a deadlock situation, because "multipath -u" (called by udev workers)
> > blocks, and thus "udev settle" doesn't finish, delaying multipathd
> > startup. This situation then persists until either the workers or
> > "udev
> > settle" time out. In the former case, path devices might be
> > misclassified
> > as non-multipath devices by "multipath -u".
> > =

> > Fix this by using a non-blocking socket fd for connect() and
> > interpret the
> > errno appropriately.
> > =

> > This patch reverts most of the changes from commit 8cdf6661
> > "multipath:
> > check on multipathd without starting it". Instead, "multipath -u"
> > does
> > access the socket and start multipath again (which is what we want
> > IMO),
> > but it is now able to detect and handle the "full backlog" situation.
> > =

> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > =

> > V2:
> > =

> > Use same error reporting convention in __mpath_connect() as in
> > mpath_connect() (Hannes Reinecke). We can't easily change the latter,
> > because it's part of the "public" libmpathcmd API. =

> =

> FTR, our customer reported that this patch fixed his problem.
> =

> @Ben, I'd be grateful if you could try it (or have the user try it)
> in your problem case as well.

Unfortunately, I don't have a 129+ path system handy that the person who
does isn't around right now.  The code makes sense, and assuming that I
can verify that it fixes the problem I'm seeing, I'm fine with going
this route.

-Ben

> =

> -- =

> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE Linux GmbH, GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=FCrnberg)
> =


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
