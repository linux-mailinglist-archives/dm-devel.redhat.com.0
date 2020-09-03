Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D701625E2E9
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 22:39:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-rYykJOF3P7aGJaxsdHubJQ-1; Fri, 04 Sep 2020 16:39:02 -0400
X-MC-Unique: rYykJOF3P7aGJaxsdHubJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05CB581F00A;
	Fri,  4 Sep 2020 20:38:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 230757E168;
	Fri,  4 Sep 2020 20:38:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19D4318561B1;
	Fri,  4 Sep 2020 20:38:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083FwXh5011716 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 11:58:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 959F1F5AD2; Thu,  3 Sep 2020 15:58:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 912A7F5ACE
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 15:58:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C2D5811E7F
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 15:58:31 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-bNQZR2G6OOuCgnoNVPD1lQ-1; Thu, 03 Sep 2020 11:58:29 -0400
X-MC-Unique: bNQZR2G6OOuCgnoNVPD1lQ-1
Received: by mail-io1-f67.google.com with SMTP id d18so3294199iop.13;
	Thu, 03 Sep 2020 08:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uzsZxPAPwSm808o5F4eOYmcOwcd/ZqMzTg6W424t1fA=;
	b=AeKLdETjnV+uZ8PgpWebrOIjGztRSQ7NqB4+tQgGkaPmvtO07xaaZyxJhNTUFDVvVT
	xX7p3ra/XuIVxHZUfxSYRRTvkbdfRFLLjac+55vJoYdpU8nyYo1prsIkY0exE4M9Y0Di
	vx90MznXnnBCtKUcC2M/tOCQQQd9QFJeWMgqC1ACvNy1Z6lEgDgIbf57ItFZiuBkOO7s
	a4uCrkdW9eIy8EBmgWe4On24aU1h5kfn9llNJo7wZ+3mFY5FOaMjWLFITqVFfvjgewEU
	vua4NBLicUi+EBEp807HG3poVXTeJei/kvNagmddNL6UDxQvUPEZh2wDCwZMWtka0IaD
	S6yA==
X-Gm-Message-State: AOAM533B3F4T2vgtV/3c67MoNWMAGKBGe6uAFFfzeOpPY60vXBkWMxwx
	uXDGVd+7g12Wv4HnGKaxsoPwu+glaKq35GrnV6I=
X-Google-Smtp-Source: ABdhPJwgzp7rHAgdPicgGPO+hWGzjxg6OMTflLGRmrMzJlTUmdC8s4mUzfFSGH/HIuxsFChtSKCyuQLp0qalHGOtp8o=
X-Received: by 2002:a05:6638:220c:: with SMTP id
	l12mr3808083jas.139.1599148708378; 
	Thu, 03 Sep 2020 08:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200903152839.19040-1-colyli@suse.de>
In-Reply-To: <20200903152839.19040-1-colyli@suse.de>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 3 Sep 2020 17:58:17 +0200
Message-ID: <CAM9Jb+gsmU-TsT99a7Kp=2owhYZFgROqHYr1aDoza0VApzAQLg@mail.gmail.com>
To: Coly Li <colyli@suse.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 04 Sep 2020 16:37:06 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal Verma <vishal.l.verma@intel.com>, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, Jan Kara <jack@suse.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] [PATCH v2] dax: fix for do not print error message
 for non-persistent memory block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> When calling __generic_fsdax_supported(), a dax-unsupported device may
> not have dax_dev as NULL, e.g. the dax related code block is not enabled
> by Kconfig.
>
> Therefore in __generic_fsdax_supported(), to check whether a device
> supports DAX or not, the following order should be performed,
> - If dax_dev pointer is NULL, it means the device driver explicitly
>   announce it doesn't support DAX. Then it is OK to directly return
>   false from __generic_fsdax_supported().
> - If dax_dev pointer is NOT NULL, it might be because the driver doesn't
>   support DAX and not explicitly initialize related data structure. Then
>   bdev_dax_supported() should be called for further check.
>
> IMHO if device driver desn't explicitly set its dax_dev pointer to NULL,
> this is not a bug. Calling bdev_dax_supported() makes sure they can be
> recognized as dax-unsupported eventually.
>
> This patch does the following change for the above purpose,
>     -       if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
>     +       if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
>
>
> Fixes: c2affe920b0e ("dax: do not print error message for non-persistent memory block device")
> Signed-off-by: Coly Li <colyli@suse.de>
> Reviewed-and-Tested-by: Adrian Huang <ahuang12@lenovo.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Jan Kara <jack@suse.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> ---
> Changelog:
> v2: add Reviewed-and-Tested-by from Adrian Huang.
> v1: initial version.
>
>  drivers/dax/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 32642634c1bb..e5767c83ea23 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -100,7 +100,7 @@ bool __generic_fsdax_supported(struct dax_device *dax_dev,
>                 return false;
>         }
>
> -       if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
> +       if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
>                 pr_debug("%s: error: dax unsupported by block device\n",
>                                 bdevname(bdev, buf));
>                 return false;
> --

Looks good.
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

