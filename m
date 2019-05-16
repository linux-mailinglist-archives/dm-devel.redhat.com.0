Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D954120FED
	for <lists+dm-devel@lfdr.de>; Thu, 16 May 2019 23:13:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70BF264123;
	Thu, 16 May 2019 21:13:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7B160BE0;
	Thu, 16 May 2019 21:13:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 592C94A460;
	Thu, 16 May 2019 21:13:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GLCYtq011166 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 17:12:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38C9F7941C; Thu, 16 May 2019 21:12:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D8587941A;
	Thu, 16 May 2019 21:12:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4GLCSKD009726; 
	Thu, 16 May 2019 16:12:29 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4GLCRK3009725;
	Thu, 16 May 2019 16:12:27 -0500
Date: Thu, 16 May 2019 16:12:27 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.de>
Message-ID: <20190516211227.GG3090@octiron.msp.redhat.com>
References: <20190424090759.29796-1-mwilck@suse.com>
	<fa3ea599bf6424587fec45b5eb3549b3200ac5e9.camel@suse.com>
	<20190429213837.GC5210@octiron.msp.redhat.com>
	<e5abf79650733d4035bac4c01168802e2ce71389.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5abf79650733d4035bac4c01168802e2ce71389.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: mwilck+gmail@suse.de, dm-devel@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 16 May 2019 21:13:56 +0000 (UTC)

On Thu, May 16, 2019 at 08:44:56AM +0200, Martin Wilck wrote:
> On Mon, 2019-04-29 at 16:38 -0500, Benjamin Marzinski wrote:
> > On Thu, Apr 25, 2019 at 09:33:03PM +0200, Martin Wilck wrote:
> > > 
> > > @Ben, I'd be grateful if you could try it (or have the user try it)
> > > in your problem case as well.
> > 
> > Unfortunately, I don't have a 129+ path system handy that the person
> > who
> > does isn't around right now.  The code makes sense, and assuming that
> > I
> > can verify that it fixes the problem I'm seeing, I'm fine with going
> > this route.
> 
> Thanks, Ben. As noted earlier, we've had several customers who reported
> this, and they're all happy with this patch. 

I did get around to testing this, and it fixes our reproducer too.

-Ben

> 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
