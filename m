Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B8A2CA34
	for <lists+dm-devel@lfdr.de>; Tue, 28 May 2019 17:19:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7593EAC2D9;
	Tue, 28 May 2019 15:18:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B637778552;
	Tue, 28 May 2019 15:18:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD92A206D2;
	Tue, 28 May 2019 15:17:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4SFGRRD013426 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 May 2019 11:16:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 043905DA5B; Tue, 28 May 2019 15:16:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E6AD5D996;
	Tue, 28 May 2019 15:16:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4SFGJqI014662; 
	Tue, 28 May 2019 10:16:19 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4SFGI6R014661;
	Tue, 28 May 2019 10:16:18 -0500
Date: Tue, 28 May 2019 10:16:18 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.de>
Message-ID: <20190528151618.GE7630@octiron.msp.redhat.com>
References: <1558737674-22335-1-git-send-email-bmarzins@redhat.com>
	<478097e8086d85ba6d0785e825a8ef9b05d21554.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <478097e8086d85ba6d0785e825a8ef9b05d21554.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: make
 vector_foreach_slot_backwards work as expected
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 28 May 2019 15:19:20 +0000 (UTC)

On Mon, May 27, 2019 at 12:03:59PM +0200, Martin Wilck wrote:
> On Fri, 2019-05-24 at 17:41 -0500, Benjamin Marzinski wrote:
> > All of the code that uses vector_foreach_slot_backwards() treats "i"
> > as
> > the index of the entry "p", but the way it was coded, that wasn't the
> > case. "i" was the number of the entry counting from 1, not 0.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/vector.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> Reviewed-by: Martin Wilck <mwilck@suse.com>
> 
> Let's add that there was only one caller that actually used
> "i"("multipath -W"). So the harm done by this bug was not as bad as one
> might think.
>  

Actually, it caused _find_controllers() to delete the wrong slot from
map->pgvec, which caused a crash on a future _find_controllers() call
because we don't check for a NULL path between

path = nvme_pg_to_path(pg);

and

path->seen = false;

Since there should never be a NULL path, I don't think we need to add
that check, but this happens in more than multipath -W. We use "i" in
_cleanup_foreign(), cleanup_nvme_map(), _delete_all(), and
_find_controllers(). 

-Ben

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
