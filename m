Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 421B4264F39
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 21:38:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-gXmkURlHMB-FD_kiXo5Dag-1; Thu, 10 Sep 2020 15:38:33 -0400
X-MC-Unique: gXmkURlHMB-FD_kiXo5Dag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0707393BC;
	Thu, 10 Sep 2020 19:38:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F3367E8EB;
	Thu, 10 Sep 2020 19:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B54C183D021;
	Thu, 10 Sep 2020 19:38:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AJc5Hi023567 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 15:38:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F223A2144B33; Thu, 10 Sep 2020 19:38:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED7B42144B2F
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 19:38:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2E10906380
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 19:38:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-203-g-QPok-3N2CgxdFvVPRGwA-1;
	Thu, 10 Sep 2020 15:37:56 -0400
X-MC-Unique: g-QPok-3N2CgxdFvVPRGwA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EC5FBACC5;
	Thu, 10 Sep 2020 19:38:10 +0000 (UTC)
Message-ID: <88f6097496038dfdf10b3dc5d36860d124cde1c9.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 10 Sep 2020 21:37:54 +0200
In-Reply-To: <22e82157-f180-b95b-c72c-b7b13acf1c8a@huawei.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
	<22e82157-f180-b95b-c72c-b7b13acf1c8a@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V4 09/14] libmultipath: check whether
 mpp->features is NUll in setup_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-10 at 18:51 +0800, lixiaokeng wrote:
> In assemble_map func, f = STRDUP(mp->features) is just used
> for APPEND(). We can directly pass mp->features to APPEND().
> The mpp->features, hwhandler and selector got form strdup
> should be check after select* function.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/configure.c |  5 +++++
>  libmultipath/dmparser.c  | 11 ++++-------
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 5bc65fd3..5d5d9415 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -355,6 +355,11 @@ int setup_map(struct multipath *mpp, char
> *params, int params_size,
>  	select_ghost_delay(conf, mpp);
>  	select_flush_on_last_del(conf, mpp);
> 
> +	if (!mpp->features || !mpp->hwhandler || !mpp->selector) {
> +		condlog(0, "%s: map select failed", mpp->alias);
> +		return 1;
> +	}
> +
> 
> 	sysfs_set_scsi_tmo(mpp, conf->checkint);
>  	marginal_pathgroups = conf->marginal_pathgroups;
>  	pthread_cleanup_pop(1);

Just saw this: you can't return between pthread_cleanup_push() and
pthread_cleanup_pop(). You need to move this block below the
pthread_cleanup_pop() statement.

So, Nack for this version of the patch. Sorry

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

