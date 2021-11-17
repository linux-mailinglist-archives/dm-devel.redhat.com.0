Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8442454CC6
	for <lists+dm-devel@lfdr.de>; Wed, 17 Nov 2021 19:05:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637172351;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tk3bm34yH8r5enLcUtB1wkXqJunChQhyuQjwx+M8zgA=;
	b=YgneKNLX7YWVhGj5tqfOUoSJL2bm+KHewSU3cy9CGd6/vF5ubeyWyW+mNNa1nsHyfPVRSi
	Nl8TXJv0keHY/h79qgmRrMtf/OxHXF0FCoaeWU3jK0WHjL/fXDJSxEVerogj10X194ye1p
	MK9OHghrI5/BwwvDaK18rOPn39sXWVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63--t_9vghHNNm1SNvis27t4A-1; Wed, 17 Nov 2021 13:05:49 -0500
X-MC-Unique: -t_9vghHNNm1SNvis27t4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 219A7814247;
	Wed, 17 Nov 2021 18:05:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECED01F470;
	Wed, 17 Nov 2021 18:05:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 742024EA2A;
	Wed, 17 Nov 2021 18:05:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHI5L1s004695 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 13:05:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C98E60BF1; Wed, 17 Nov 2021 18:05:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 148AE60C13;
	Wed, 17 Nov 2021 18:05:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AHI5Iw9003748; 
	Wed, 17 Nov 2021 12:05:18 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AHI5Hv8003747;
	Wed, 17 Nov 2021 12:05:17 -0600
Date: Wed, 17 Nov 2021 12:05:17 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20211117180517.GX19591@octiron.msp.redhat.com>
References: <78637f61-851d-cf9d-d308-9c22396d2071@huawei.com>
	<7a7efb76-ae21-0630-aab5-52d6b06d93ef@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7a7efb76-ae21-0630-aab5-52d6b06d93ef@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 1/5] Fix potential null pointer dereference
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

On Tue, Nov 16, 2021 at 09:59:14PM +0800, lixiaokeng wrote:
> udev_device_* may return NULL, check it.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/discovery.c    |  8 +++++---
>  libmultipath/foreign/nvme.c |  4 +++-
>  libmultipath/util.c         | 10 +++++++++-
>  3 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index f25fe9e3..48f3d8b2 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -388,8 +388,10 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
>  		if (value && !strcmp(value, "usb")) {
>  			pp->sg_id.proto_id = SCSI_PROTOCOL_USB;
>  			tgtname = udev_device_get_sysname(tgtdev);
> -			strlcpy(node, tgtname, NODE_NAME_SIZE);
> -			return 0;
> +			if (!tgtname) {

I assume that you mean "if (tgtname)"

> +				strlcpy(node, tgtname, NODE_NAME_SIZE);
> +				return 0;
> +			}
>  		}
>  		tgtdev = udev_device_get_parent(tgtdev);
>  	}
> @@ -803,7 +805,7 @@ sysfs_set_nexus_loss_tmo(struct multipath *mpp, struct path *pp)
>  	     parent = udev_device_get_parent(parent)) {
>  		const char *ed = udev_device_get_sysname(parent);
> 
> -		if (!strncmp(ed, ed_str, sizeof(ed_str) - 1)) {
> +		if (ed && !strncmp(ed, ed_str, sizeof(ed_str) - 1)) {
>  			end_dev_id = ed;
>  			break;
>  		}
> diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
> index d40c0869..f778410a 100644
> --- a/libmultipath/foreign/nvme.c
> +++ b/libmultipath/foreign/nvme.c
> @@ -184,7 +184,9 @@ static int snprint_nvme_map(const struct gen_multipath *gmp,
>  							      "firmware_rev"));
>  	case 'r':
>  		val = udev_device_get_sysattr_value(nvm->udev, "ro");
> -		if (val[0] == 1)
> +		if (!val)
> +			return -1;

sprint_ro() returns "undef" for a similar case. Perhaps we should do
that here as well.

-Ben

> +		else if (val[0] == 1)
>  			return append_strbuf_str(buff, "ro");
>  		else
>  			return append_strbuf_str(buff, "rw");
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index ea858409..3d036e19 100644
> --- a/libmultipath/util.c
> +++ b/libmultipath/util.c
> @@ -168,6 +168,7 @@ size_t strlcat(char * restrict dst, const char * restrict src, size_t size)
>  int devt2devname(char *devname, int devname_len, const char *devt)
>  {
>  	struct udev_device *u_dev;
> +	const char * dev_name;
>  	int r;
> 
>  	if (!devname || !devname_len || !devt)
> @@ -178,7 +179,14 @@ int devt2devname(char *devname, int devname_len, const char *devt)
>  		condlog(0, "\"%s\": invalid major/minor numbers, not found in sysfs", devt);
>  		return 1;
>  	}
> -	r = strlcpy(devname, udev_device_get_sysname(u_dev), devname_len);
> +
> +	dev_name = udev_device_get_sysname(u_dev);
> +	if (!dev_name) {
> +		condlog(2, "\"%s\": fail to get sysname\n", devt);
> +		udev_device_unref(u_dev);
> +		return 1;
> +	}
> +	r = strlcpy(devname, dev_name, devname_len);
>  	udev_device_unref(u_dev);
> 
>  	return !(r < devname_len);
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

