Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2033C23177A
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jul 2020 03:57:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-l-JDhQS2OGO73sHcIGTRZg-1; Tue, 28 Jul 2020 21:56:58 -0400
X-MC-Unique: l-JDhQS2OGO73sHcIGTRZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CD59800475;
	Wed, 29 Jul 2020 01:56:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E61F61002388;
	Wed, 29 Jul 2020 01:56:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E62F1809554;
	Wed, 29 Jul 2020 01:56:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06T1smHu022407 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 21:54:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9D321009A05; Wed, 29 Jul 2020 01:54:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B53251111C70
	for <dm-devel@redhat.com>; Wed, 29 Jul 2020 01:54:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CE2A8007A4
	for <dm-devel@redhat.com>; Wed, 29 Jul 2020 01:54:45 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-5VVOgeKxM2ipCww-lWEWsw-1; Tue, 28 Jul 2020 21:54:40 -0400
X-MC-Unique: 5VVOgeKxM2ipCww-lWEWsw-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 563D52B8A3FB0B149D06;
	Wed, 29 Jul 2020 09:54:37 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 29 Jul 2020 09:54:28 +0800
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
To: <bmarzins@redhat.com>, <mwilck@suse.com>, <hare@suse.de>,
	<christophe.varoqui@opensvc.com>, <kabelac@redhat.com>
References: <b444af45-dbc3-2525-066f-4475efdc1a57@huawei.com>
Message-ID: <beea69eb-ecc9-1bc7-2fdc-5925c86fde9d@huawei.com>
Date: Wed, 29 Jul 2020 09:54:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b444af45-dbc3-2525-066f-4475efdc1a57@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, yanxiaodan@huawei.com,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [dm- devel][PATCH V2]
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sorry for forgetting to add a subject.
I will resend the v2 patch.

On 2020/7/29 9:52, Zhiqiang Liu wrote:
> 
> In disassemble_status func, for dealing with selector args,
> word is allocated by get_word func. However, word is not freed.
> Then a memory leak occurs.
> 
> Here, we call FREE(word) to free word.
> 
> Fixes: 35ad40b4 ('leastpending IO loadbalancing is not displayed properly')
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/dmparser.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> index 3dc77242..33f47405 100644
> --- a/libmultipath/dmparser.c
> +++ b/libmultipath/dmparser.c
> @@ -580,10 +580,15 @@ int disassemble_status(char *params, struct multipath *mpp)
>  				if (!strncmp(mpp->selector,
>  					     "least-pending", 13)) {
>  					p += get_word(p, &word);
> +
> +					if (!word)
> +						return 1;
> +
>  					if (sscanf(word,"%d:*d",
>  						   &def_minio) == 1 &&
>  					    def_minio != mpp->minio)
>  							mpp->minio = def_minio;
> +					FREE(word);
>  				} else
>  					p += get_word(p, NULL);
>  			}
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

