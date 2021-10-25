Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A958943907D
	for <lists+dm-devel@lfdr.de>; Mon, 25 Oct 2021 09:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635147649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hG4kwN/XZYd+u9ycfnunf43huTjA0W6sAWZveCd7ZcQ=;
	b=Su9tb+gTcu9tSChupadDz+krzjDgpGJbq+M1SEYyBEadWaJUZbmusAg7aRj4txpmNLd8UV
	JYj1Nf6cMxMGKEyXf12uA6X+k4TKs1EE/Q7ds0hP2Jocg54bxNnCS6hnuvkHKYLrJqMHt+
	XCwdsiHyoE7MkzZZE1EXrkAVoLiEQVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-zRgjx-DHM4WjB5Pmk8b_eA-1; Mon, 25 Oct 2021 03:40:46 -0400
X-MC-Unique: zRgjx-DHM4WjB5Pmk8b_eA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 680621006AA2;
	Mon, 25 Oct 2021 07:40:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F6260CC9;
	Mon, 25 Oct 2021 07:40:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C0C31801241;
	Mon, 25 Oct 2021 07:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19P1iAjI001917 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 Oct 2021 21:44:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D20F9400F3F3; Mon, 25 Oct 2021 01:44:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB2840149B4
	for <dm-devel@redhat.com>; Mon, 25 Oct 2021 01:44:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6CA1811E78
	for <dm-devel@redhat.com>; Mon, 25 Oct 2021 01:44:10 +0000 (UTC)
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
	[209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-269-PTDSHe2XNoOp8ewFElg-wg-1; Sun, 24 Oct 2021 21:44:09 -0400
X-MC-Unique: PTDSHe2XNoOp8ewFElg-wg-1
Received: by mail-yb1-f197.google.com with SMTP id
	m81-20020a252654000000b005c135d4efdeso13194044ybm.22
	for <dm-devel@redhat.com>; Sun, 24 Oct 2021 18:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N+DIrvZXbcAkXJ/OchXf+lha18HEJRfjUfzTN2XxsYY=;
	b=nG8HpItbr7UZJYzZA14IvbfbKlvMVn2mNZeBRNcoFLYTvX9iQe1ka72w/u/R9VrU87
	iAEUdEwF4oPNVE/NFLa8wOMIiW8maQ+SJov053cWh1OIpI0pMJ2tVLFfEbEKwGfickt3
	16SeQ7F/2mSSjOizbp21ZTPjUV+BaoHwxx8ccPd1Etu1DzZcRrRHwFhb6z8BmeI6cvGp
	yME2DnnQ8VCls4kT7OFfXqzt7Hl2Gmls7uRddMwMVnTK2LeJ0w89XQ797rJWm24HcZmE
	LxHMf2PZNgNd5Zr83thnVS2psn1HVjAGMdcAdsSnCc2Ndt29J1eKpC6/rfFXKJ+j9ocA
	nHVA==
X-Gm-Message-State: AOAM53145qJBfbvDdCXo1Nij5FLSNgFnPY9SAx5F7vH3eNm/8oJc0t8P
	Qlegr/cJSg23d7DKxfe5oiY1rAxZck0ytQVFRfvFD520YtumiofBeO0J0SGMnKBwOx0/pd7vL/t
	OI2s5clBOOmZq6s01Gqt/Bc1D04ZhCjs=
X-Received: by 2002:a5b:18c:: with SMTP id r12mr14527344ybl.308.1635126248669; 
	Sun, 24 Oct 2021 18:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXgAebb5EiOX8n3xGCGi7pF2GMyeviasxkrMIBZ4FLVtuGqvIhRrxVJyTEMj3M5GvFesVhioiqCJC2jL6JZ2s=
X-Received: by 2002:a5b:18c:: with SMTP id r12mr14527331ybl.308.1635126248542; 
	Sun, 24 Oct 2021 18:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211021145918.2691762-1-ming.lei@redhat.com>
In-Reply-To: <20211021145918.2691762-1-ming.lei@redhat.com>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Mon, 25 Oct 2021 09:43:57 +0800
Message-ID: <CAHj4cs8QB7QCc7t+bweesdZPOLmAXrwrj8yEnAtJPk80L_v1kQ@mail.gmail.com>
To: Ming Lei <ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 Oct 2021 03:40:10 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	linux-block <linux-block@vger.kernel.org>, dm-devel@redhat.com,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Subject: Re: [dm-devel] [PATCH 0/3] block: keep quiesce & unquiesce balanced
	for scsi/dm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Verified with the blktests srp/, thanks Ming.

Tested-by: Yi Zhang <yi.zhang@redhat.com>

On Thu, Oct 21, 2021 at 11:00 PM Ming Lei <ming.lei@redhat.com> wrote:
>
> Hello Jens,
>
> Recently we merge the patch of e70feb8b3e68 ("blk-mq: support concurrent queue
> quiesce/unquiesce") for fixing race between driver and block layer wrt.
> queue quiesce.
>
> Yi reported that srp/002 is broken with this patch, turns out scsi and
> dm don't keep the two balanced actually.
>
> So fix dm and scsi and make srp/002 pass again.
>
>
> Ming Lei (3):
>   scsi: avoid to quiesce sdev->request_queue two times
>   scsi: make sure that request queue queiesce and unquiesce balanced
>   dm: don't stop request queue after the dm device is suspended
>
>  drivers/md/dm.c            | 10 ------
>  drivers/scsi/scsi_lib.c    | 70 ++++++++++++++++++++++++++------------
>  include/scsi/scsi_device.h |  1 +
>  3 files changed, 49 insertions(+), 32 deletions(-)
>
> --
> 2.31.1
>


-- 
Best Regards,
  Yi Zhang

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

