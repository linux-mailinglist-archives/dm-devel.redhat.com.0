Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3A32D390B
	for <lists+dm-devel@lfdr.de>; Wed,  9 Dec 2020 03:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607482530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AnPtIsen4ng4FOxa3VKDIUC7wcj0TgjIgUpuJ6cYRX4=;
	b=cqDmNMS4HFvZtbfOVT0+PFx46EdUIPSWJnncUScrz7rHYVgV7JsrOIaDtrpVaUp/AJcIcB
	FYXLQ+ZlWBvqFrlHOLPXz962h+skp6RHgikxmHcXtQpGox2autO3/M6hBje0ythwSpXd1v
	2GVb4aEOWjJD83pCYbpYoXIaq/+KH/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-_SUx9RVpPAGXDldvkZEa0A-1; Tue, 08 Dec 2020 21:55:27 -0500
X-MC-Unique: _SUx9RVpPAGXDldvkZEa0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C6EB1005D44;
	Wed,  9 Dec 2020 02:55:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26EDB19725;
	Wed,  9 Dec 2020 02:55:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E488180954D;
	Wed,  9 Dec 2020 02:55:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B92tHVX017133 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 21:55:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4DF1C19C78; Wed,  9 Dec 2020 02:55:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-139.pek2.redhat.com [10.72.12.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B90D019725;
	Wed,  9 Dec 2020 02:55:01 +0000 (UTC)
Date: Wed, 9 Dec 2020 10:54:56 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201209025456.GF1217988@T590>
References: <20201208162829.2424563-1-hch@lst.de>
	<20201208162829.2424563-7-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201208162829.2424563-7-hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Mike Snitzer <snitzer@redhat.com>, Oleksii Kurochko <olkuroch@cisco.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Keith Busch <kbusch@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 6/6] nvme: allow revalidate to set a
	namespace read-only
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

On Tue, Dec 08, 2020 at 05:28:29PM +0100, Christoph Hellwig wrote:
> Unconditionally call set_disk_ro now that it only updates the hardware
> state.  This allows to properly set up the Linux devices read-only when
> the controller turns a previously writable namespace read-only.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>  drivers/nvme/host/core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index ce1b6151944131..3a0557ccc9fc5d 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -2114,9 +2114,8 @@ static void nvme_update_disk_info(struct gendisk *disk,
>  	nvme_config_discard(disk, ns);
>  	nvme_config_write_zeroes(disk, ns);
>  
> -	if ((id->nsattr & NVME_NS_ATTR_RO) ||
> -	    test_bit(NVME_NS_FORCE_RO, &ns->flags))
> -		set_disk_ro(disk, true);
> +	set_disk_ro(disk, (id->nsattr & NVME_NS_ATTR_RO) ||
> +		test_bit(NVME_NS_FORCE_RO, &ns->flags));
>  }
>  
>  static inline bool nvme_first_scan(struct gendisk *disk)
> -- 
> 2.29.2
> 

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

