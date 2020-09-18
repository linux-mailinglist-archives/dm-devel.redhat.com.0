Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8CD026F676
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 09:04:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-qVsw80DHPmW--qv1DSwANw-1; Fri, 18 Sep 2020 03:04:02 -0400
X-MC-Unique: qVsw80DHPmW--qv1DSwANw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DFEC80B727;
	Fri, 18 Sep 2020 07:03:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B91B573660;
	Fri, 18 Sep 2020 07:03:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC22918408A0;
	Fri, 18 Sep 2020 07:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I704KO016039 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 03:00:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B97072028CCE; Fri, 18 Sep 2020 07:00:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4AC32026F94
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 07:00:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D36A8007D9
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 07:00:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-214-mWMcR3q0P1-mKI1kUrWh1A-1;
	Fri, 18 Sep 2020 02:59:58 -0400
X-MC-Unique: mWMcR3q0P1-mKI1kUrWh1A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C3467ACF2;
	Fri, 18 Sep 2020 07:00:30 +0000 (UTC)
Message-ID: <d2a60cf65fc4d3d5833a963bcaffbcc3eb03abd8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Fri, 18 Sep 2020 08:59:55 +0200
In-Reply-To: <2e194628-4c9b-e259-f2b3-3c09e134575c@huawei.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
	<2e194628-4c9b-e259-f2b3-3c09e134575c@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 5/6] libmultipath: check udev* renturn value
 in get_ctrl_blkdev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-15 at 12:41 +0800, lixiaokeng wrote:
> We check return value of udev_device_get_devtype before
> dereference it.
> 
> Signed-off-by:Lixiaokeng<lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  libmultipath/foreign/nvme.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/foreign/nvme.c
> b/libmultipath/foreign/nvme.c
> index 0bc5106e..a0668713 100644
> --- a/libmultipath/foreign/nvme.c
> +++ b/libmultipath/foreign/nvme.c
> @@ -538,6 +538,7 @@ struct udev_device *get_ctrl_blkdev(const struct
> context *ctx,
>  	struct udev_list_entry *item;
>  	struct udev_device *blkdev = NULL;
>  	struct udev_enumerate *enm = udev_enumerate_new(ctx->udev);
> +	const char *devtype;
> 
>  	if (enm == NULL)
>  		return NULL;
> @@ -562,7 +563,9 @@ struct udev_device *get_ctrl_blkdev(const struct
> context *ctx,
>  					   udev_list_entry_get_name(ite
> m));
>  		if (tmp == NULL)
>  			continue;
> -		if (!strcmp(udev_device_get_devtype(tmp), "disk")) {
> +
> +		devtype = udev_device_get_devtype(tmp);
> +		if (!devtype && !strcmp(devtype, "disk")) {
>  			blkdev = tmp;
>  			break;
>  		} else

This looks wrong.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

