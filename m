Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5290421
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 16:45:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A72D93090FC8;
	Fri, 16 Aug 2019 14:45:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 412D48F6D8;
	Fri, 16 Aug 2019 14:45:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B5051800202;
	Fri, 16 Aug 2019 14:45:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GEjTVp031064 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 10:45:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8310844F92; Fri, 16 Aug 2019 14:45:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F85444F8C;
	Fri, 16 Aug 2019 14:45:27 +0000 (UTC)
Date: Fri, 16 Aug 2019 10:45:26 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Bryan Gurney <bgurney@redhat.com>
Message-ID: <20190816144526.GA2468@redhat.com>
References: <1565964593-13195-1-git-send-email-bgurney@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565964593-13195-1-git-send-email-bgurney@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm dust: use dust blksz for badblocklist index
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 16 Aug 2019 14:45:46 +0000 (UTC)

On Fri, Aug 16 2019 at 10:09am -0400,
Bryan Gurney <bgurney@redhat.com> wrote:

> Change the "frontend" dust_remove_block, dust_add_block, and
> dust_query_block functions to store the "dust block number", instead
> of the sector number corresponding to the "dust block number"
> 
> For the "backend" functions dust_map_read and dust_map_write,
> right-shift by sect_per_block_shift.  This fixes the inability
> to emulate failure beyond the first sector of each "dust block",
> for devices with a "dust block size" larger than 512 bytes.
> 
> Signed-off-by: Bryan Gurney <bgurney@redhat.com>

Thanks, I tweaked the header very slightly and staged it in linux-next
for 5.4 via linux-dm.git.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
