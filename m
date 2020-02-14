Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 446F91659D5
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189614;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fBf0nCHl/Zv0+m5jUmnN3q/FuhDlJM9FohxNbm+xZA4=;
	b=C3XrTs5z6P97WfrbRW8yjNNEq3A4lxx03ERbPoGdXFIm6nxvr57B5qsDrugDCAPOIsfTjb
	0D2G3c8BingDZGUSIPUPdCWQtuIS5qFVkHz8/gte/oBbV1rhr6dmxJ55eukTOhOQpYw8hI
	sJrtxKBz4r3kr/ZgwncyVX2NnWdgJ3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-ZAdTJD4wO4qf7TM628uE2w-1; Thu, 20 Feb 2020 04:06:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB57800D5B;
	Thu, 20 Feb 2020 09:06:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB7FC60C63;
	Thu, 20 Feb 2020 09:06:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F4E118034F0;
	Thu, 20 Feb 2020 09:06:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01E1ugtN018299 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 20:56:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 14D6E120EC7; Fri, 14 Feb 2020 01:56:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F00ED162
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 01:56:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EBE01859165
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 01:56:38 +0000 (UTC)
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-276-CSsXmyAjN66rEaJH4CN2LQ-1; Thu, 13 Feb 2020 20:56:32 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.55])
	by Forcepoint Email with ESMTP id 1345E3E420F2A9B5488E;
	Fri, 14 Feb 2020 09:40:47 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
	DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Fri, 14 Feb 2020 09:40:46 +0800
Received: from architecture4 (10.160.196.180) by
	dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1713.5; Fri, 14 Feb 2020 09:40:46 +0800
Date: Fri, 14 Feb 2020 09:39:33 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
Message-ID: <20200214013932.GA73422@architecture4>
References: <20200213141823.2174236-1-mplaneta@os.inf.tu-dresden.de>
MIME-Version: 1.0
In-Reply-To: <20200213141823.2174236-1-mplaneta@os.inf.tu-dresden.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.160.196.180]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
	dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-MC-Unique: CSsXmyAjN66rEaJH4CN2LQ-1
X-MC-Unique: ZAdTJD4wO4qf7TM628uE2w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01E1ugtN018299
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	Chao Yu <chao@kernel.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	linux-crypto@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] Remove WQ_CPU_INTENSIVE flag from unbound
	wq's
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 13, 2020 at 03:18:23PM +0100, Maksym Planeta wrote:
> The documentation [1] says that WQ_CPU_INTENSIVE is "meaningless" for
> unbound wq. I remove this flag from places where unbound queue is
> allocated. This is supposed to improve code readability.
> 
> 1. https://www.kernel.org/doc/html/latest/core-api/workqueue.html#flags
> 
> Signed-off-by: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
> ---
>  drivers/crypto/hisilicon/qm.c | 3 +--
>  drivers/md/dm-crypt.c         | 2 +-
>  drivers/md/dm-verity-target.c | 2 +-
>  drivers/md/raid5.c            | 2 +-
>  fs/erofs/zdata.c              | 2 +-

I'm okay for EROFS part,

Acked-by: Gao Xiang <gaoxiang25@huawei.com>

Thanks,
Gao Xiang

>  5 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
> index b57da5ef8b5b..4a39cb2c6a0b 100644
> --- a/drivers/crypto/hisilicon/qm.c
> +++ b/drivers/crypto/hisilicon/qm.c
> @@ -1148,8 +1148,7 @@ struct hisi_qp *hisi_qm_create_qp(struct hisi_qm *qm, u8 alg_type)
>  	qp->qp_id = qp_id;
>  	qp->alg_type = alg_type;
>  	INIT_WORK(&qp->work, qm_qp_work_func);
> -	qp->wq = alloc_workqueue("hisi_qm", WQ_UNBOUND | WQ_HIGHPRI |
> -				 WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM, 0);
> +	qp->wq = alloc_workqueue("hisi_qm", WQ_UNBOUND | WQ_HIGHPRI | WQ_MEM_RECLAIM, 0);
>  	if (!qp->wq) {
>  		ret = -EFAULT;
>  		goto err_free_qp_mem;
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index c6a529873d0f..44d56325fa27 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -3032,7 +3032,7 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  						  1, devname);
>  	else
>  		cc->crypt_queue = alloc_workqueue("kcryptd/%s",
> -						  WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
> +						  WQ_MEM_RECLAIM | WQ_UNBOUND,
>  						  num_online_cpus(), devname);
>  	if (!cc->crypt_queue) {
>  		ti->error = "Couldn't create kcryptd queue";
> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index 0d61e9c67986..20f92c7ea07e 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -1190,7 +1190,7 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
>  	}
>  
>  	/* WQ_UNBOUND greatly improves performance when running on ramdisk */
> -	v->verify_wq = alloc_workqueue("kverityd", WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND, num_online_cpus());
> +	v->verify_wq = alloc_workqueue("kverityd", WQ_MEM_RECLAIM | WQ_UNBOUND, num_online_cpus());
>  	if (!v->verify_wq) {
>  		ti->error = "Cannot allocate workqueue";
>  		r = -ENOMEM;
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index ba00e9877f02..cd93a1731b82 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -8481,7 +8481,7 @@ static int __init raid5_init(void)
>  	int ret;
>  
>  	raid5_wq = alloc_workqueue("raid5wq",
> -		WQ_UNBOUND|WQ_MEM_RECLAIM|WQ_CPU_INTENSIVE|WQ_SYSFS, 0);
> +		WQ_UNBOUND|WQ_MEM_RECLAIM|WQ_SYSFS, 0);
>  	if (!raid5_wq)
>  		return -ENOMEM;
>  
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 80e47f07d946..b2a679f720e9 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -43,7 +43,7 @@ void z_erofs_exit_zip_subsystem(void)
>  static inline int z_erofs_init_workqueue(void)
>  {
>  	const unsigned int onlinecpus = num_possible_cpus();
> -	const unsigned int flags = WQ_UNBOUND | WQ_HIGHPRI | WQ_CPU_INTENSIVE;
> +	const unsigned int flags = WQ_UNBOUND | WQ_HIGHPRI;
>  
>  	/*
>  	 * no need to spawn too many threads, limiting threads could minimum
> -- 
> 2.24.1
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

