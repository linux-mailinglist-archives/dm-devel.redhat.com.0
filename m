Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA1A26F66D
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 09:02:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-bsUfQOzRPpGbYQ9HRF0mcg-1; Fri, 18 Sep 2020 03:02:31 -0400
X-MC-Unique: bsUfQOzRPpGbYQ9HRF0mcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BFC11891E8C;
	Fri, 18 Sep 2020 07:02:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82EF11002397;
	Fri, 18 Sep 2020 07:02:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABB7044A77;
	Fri, 18 Sep 2020 07:02:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I6wHB7015796 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 02:58:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0554A100BC8C; Fri, 18 Sep 2020 06:58:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0053D10064E1
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 06:58:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D265B80088F
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 06:58:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-183-WNzkfYP9Pj2HaslnzGGiIg-1;
	Fri, 18 Sep 2020 02:58:11 -0400
X-MC-Unique: WNzkfYP9Pj2HaslnzGGiIg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 04573ACF2;
	Fri, 18 Sep 2020 06:58:44 +0000 (UTC)
Message-ID: <8d91632f52d943cb7e95b4b8cc595fc4720ee83f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Fri, 18 Sep 2020 08:58:08 +0200
In-Reply-To: <40f72a77-5dcc-89e4-e164-d19e0da10699@huawei.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
	<40f72a77-5dcc-89e4-e164-d19e0da10699@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 6/6] libmultipath: check udev* return value
 in _find_path_by_syspath
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-15 at 12:42 +0800, lixiaokeng wrote:
> We check udev_device_get_syspath return value before
> dereference it.
> 
> Signed-off-by: Lixiaokeng<lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  libmultipath/foreign/nvme.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/foreign/nvme.c
> b/libmultipath/foreign/nvme.c
> index a0668713..28e0d192 100644
> --- a/libmultipath/foreign/nvme.c
> +++ b/libmultipath/foreign/nvme.c
> @@ -482,6 +482,7 @@ _find_path_by_syspath(struct nvme_map *map, const
> char *syspath)
>  	struct nvme_pathgroup *pg;
>  	char real[PATH_MAX];
>  	const char *ppath;
> +	const char *psyspath;
>  	int i;
> 
>  	ppath = realpath(syspath, real);
> @@ -493,8 +494,8 @@ _find_path_by_syspath(struct nvme_map *map, const
> char *syspath)
>  	vector_foreach_slot(&map->pgvec, pg, i) {
>  		struct nvme_path *path = nvme_pg_to_path(pg);
> 
> -		if (!strcmp(ppath,
> -			    udev_device_get_syspath(path->udev)))
> +		psyspath = udev_device_get_syspath(path->udev);
> +		if (!psyspath && !strcmp(ppath, psyspath))
>  			return path;
>  	}
>  	condlog(4, "%s: %s: %s not found", __func__, THIS, ppath);

This looks wrong to me.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

