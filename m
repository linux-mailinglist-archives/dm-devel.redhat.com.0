Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E595E361607
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 01:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618528868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QDURpB220vqoSK1b28OulxVbPv5+1/l2H1JMcksSoZI=;
	b=fLKTrX9mBNWNe1ksFH9KLOeRFismIUDPU6O9pn7gvdiKeL8IIMwZIuBGvFaR6nKXbDJLzA
	NPr/APkmL9D3uvN1QbTd8zb148ekMY86TR1pwa//6Au89spfC1lWpycXy3mdLyY640d6Hp
	EDDvlJhm6cJ5ZvLG61xp1WHiawc+prM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-bVqgkirrOiajNeAadbVyqA-1; Thu, 15 Apr 2021 19:21:05 -0400
X-MC-Unique: bVqgkirrOiajNeAadbVyqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0EFC8026AD;
	Thu, 15 Apr 2021 23:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F150319706;
	Thu, 15 Apr 2021 23:20:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7677444A5E;
	Thu, 15 Apr 2021 23:20:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FNIJla011362 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 19:18:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE1965D71F; Thu, 15 Apr 2021 23:18:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8631E62677;
	Thu, 15 Apr 2021 23:18:16 +0000 (UTC)
Date: Thu, 15 Apr 2021 19:18:15 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Message-ID: <20210415231815.GA16047@redhat.com>
References: <20210415231126.8746-1-snitzer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415231126.8746-1-snitzer@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org
Subject: Re: [dm-devel] nvme: Return BLK_STS_TARGET if the DNR bit is set
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sorry, emailed from wrong terminal... have since emailed correct v2

On Thu, Apr 15 2021 at  7:11pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> BZ: 1948690
> Upstream Status: RHEL-only
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> 
> rhel-8.git commit ef4ab90c12db5e0e50800ec323736b95be7a6ff5
> Author: Mike Snitzer <snitzer@redhat.com>
> Date:   Tue Aug 25 21:52:45 2020 -0400
> 
>     [nvme] nvme: Return BLK_STS_TARGET if the DNR bit is set
>     
>     Message-id: <20200825215248.2291-8-snitzer@redhat.com>
>     Patchwork-id: 325178
>     Patchwork-instance: patchwork
>     O-Subject: [RHEL8.3 PATCH 07/10] nvme: Return BLK_STS_TARGET if the DNR bit is set
>     Bugzilla: 1843515
>     RH-Acked-by: David Milburn <dmilburn@redhat.com>
>     RH-Acked-by: Gopal Tiwari <gtiwari@redhat.com>
>     RH-Acked-by: Ewan Milne <emilne@redhat.com>
>     
>     BZ: 1843515
>     Upstream Status: RHEL-only
>     
>     If the DNR bit is set we should not retry the command, even if
>     the standard status evaluation indicates so.
>     
>     SUSE is carrying this patch in their kernel:
>     https://lwn.net/Articles/800370/
>     
>     Based on patch posted for upstream inclusion but rejected:
>     v1: https://lore.kernel.org/linux-nvme/20190806111036.113233-1-hare@suse.de/
>     v2: https://lore.kernel.org/linux-nvme/20190807071208.101882-1-hare@suse.de/
>     v2-keith: https://lore.kernel.org/linux-nvme/20190807144725.GB25621@localhost.localdomain/
>     v3: https://lore.kernel.org/linux-nvme/20190812075147.79598-1-hare@suse.de/
>     v3-keith: https://lore.kernel.org/linux-nvme/20190813141510.GB32686@localhost.localdomain/
>     
>     This commit's change is basically "v3-keith".
>     
>     Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>     Signed-off-by: Frantisek Hrbata <fhrbata@redhat.com>
> 
> ---
>  drivers/nvme/host/core.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> Index: linux-rhel9/drivers/nvme/host/core.c
> ===================================================================
> --- linux-rhel9.orig/drivers/nvme/host/core.c
> +++ linux-rhel9/drivers/nvme/host/core.c
> @@ -237,6 +237,9 @@ static void nvme_delete_ctrl_sync(struct
>  
>  static blk_status_t nvme_error_status(u16 status)
>  {
> +	if (unlikely(status & NVME_SC_DNR))
> +		return BLK_STS_TARGET;
> +
>  	switch (status & 0x7ff) {
>  	case NVME_SC_SUCCESS:
>  		return BLK_STS_OK;

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

