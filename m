Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 85966264DC1
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 20:50:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-vWTYNXpVP7mZfliCoCJc8Q-1; Thu, 10 Sep 2020 14:50:38 -0400
X-MC-Unique: vWTYNXpVP7mZfliCoCJc8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 823B518B9EDE;
	Thu, 10 Sep 2020 18:50:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C7E41A800;
	Thu, 10 Sep 2020 18:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3177922E1;
	Thu, 10 Sep 2020 18:50:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AIoHQT019235 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 14:50:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB50A10D17BF; Thu, 10 Sep 2020 18:50:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6651115D7CC
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 18:50:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EF401021F60
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 18:50:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-300-omXTyhGxOHarwYi-J7JsWQ-1;
	Thu, 10 Sep 2020 14:50:12 -0400
X-MC-Unique: omXTyhGxOHarwYi-J7JsWQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9BF61AD92;
	Thu, 10 Sep 2020 18:50:26 +0000 (UTC)
Message-ID: <9d263718209e39bee19a21e26075bcccadf91888.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 10 Sep 2020 20:50:10 +0200
In-Reply-To: <3b8dc5f8-2fbc-e051-7151-d39308c4aa44@huawei.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
	<3b8dc5f8-2fbc-e051-7151-d39308c4aa44@huawei.com>
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
Subject: Re: [dm-devel] [PATCH V4 14/14] multipathpersist: delete unused
 variable in handle_args
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-10 at 18:54 +0800, lixiaokeng wrote:
> In handle_args, the tmp isn't used. We delete it.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>


> ---
>  mpathpersist/main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mpathpersist/main.c b/mpathpersist/main.c
> index da67c15c..85453ac2 100644
> --- a/mpathpersist/main.c
> +++ b/mpathpersist/main.c
> @@ -211,7 +211,6 @@ static int handle_args(int argc, char * argv[],
> int nline)
>  	int prout_sa = -1;
>  	char *batch_fn = NULL;
>  	void *resp = NULL;
> -	struct transportid * tmp;
> 
>  	memset(transportids, 0, MPATH_MX_TIDS * sizeof(struct
> transportid));
> 



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

