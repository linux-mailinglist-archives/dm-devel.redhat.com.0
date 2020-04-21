Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 146351B1B21
	for <lists+dm-devel@lfdr.de>; Tue, 21 Apr 2020 03:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587431547;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IovEsyQR3GSCkNr8yoORUM0BqOiRY09jU3jZr8xhGGo=;
	b=JpBuVB9hAlZmY/zt7Ijp3107xGaywHDoBMGubfOwQz9CwO/kfWUXuDjmwUbh1qqpuze+ME
	VKR7vWvLGTVR+wwWBNHO0EuKMIEH70NAvWQ4TUjp1gH8hKM6V79kmfP2gFza0/v9KUhOsW
	s+WvI8DEVg70yGSoL9cE5mIjkCCxdUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-MRk1vjhKMNGeyu6gHa0u3Q-1; Mon, 20 Apr 2020 21:12:23 -0400
X-MC-Unique: MRk1vjhKMNGeyu6gHa0u3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B7ED107ACCC;
	Tue, 21 Apr 2020 01:12:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1717A1896;
	Tue, 21 Apr 2020 01:12:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6105593901;
	Tue, 21 Apr 2020 01:12:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03L1BjaN009931 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 21:11:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FEC82166B28; Tue, 21 Apr 2020 01:11:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C5832166B27
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 01:11:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 986628FF681
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 01:11:42 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-EJOLfzxFPKmn3gR4XP5Mfg-1; Mon, 20 Apr 2020 21:11:38 -0400
X-MC-Unique: EJOLfzxFPKmn3gR4XP5Mfg-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 2ADD185897AB7DAC0110;
	Tue, 21 Apr 2020 09:11:33 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.235) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 21 Apr 2020 09:11:23 +0800
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <a7643d1a-940b-c8a8-686e-a660f0feeb96@huawei.com>
Message-ID: <7b6493a0-685f-5f39-b948-a27716d48cc5@huawei.com>
Date: Tue, 21 Apr 2020 09:11:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a7643d1a-940b-c8a8-686e-a660f0feeb96@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.166.215.235]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03L1BjaN009931
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, "wubo \(T\)" <wubo40@huawei.com>,
	Mingfangsen <mingfangsen@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>
Subject: Re: [dm-devel] [PATCH] md/persistent-data: exit_ro_spine func
	return void
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Friendly ping..

On 2020/4/15 19:57, Zhiqiang Liu wrote:
> From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> 
> In commit 4c7da06f5a78 ("dm persistent data: eliminate unnecessary return values"),
> r value in exit_ro_spine will not changes, so exit_ro_spine donot need
> to return values.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> ---
>  drivers/md/persistent-data/dm-btree-internal.h | 2 +-
>  drivers/md/persistent-data/dm-btree-spine.c    | 6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/md/persistent-data/dm-btree-internal.h b/drivers/md/persistent-data/dm-btree-internal.h
> index a240990a7f33..55a4096f1334 100644
> --- a/drivers/md/persistent-data/dm-btree-internal.h
> +++ b/drivers/md/persistent-data/dm-btree-internal.h
> @@ -68,7 +68,7 @@ struct ro_spine {
>  };
> 
>  void init_ro_spine(struct ro_spine *s, struct dm_btree_info *info);
> -int exit_ro_spine(struct ro_spine *s);
> +void exit_ro_spine(struct ro_spine *s);
>  int ro_step(struct ro_spine *s, dm_block_t new_child);
>  void ro_pop(struct ro_spine *s);
>  struct btree_node *ro_node(struct ro_spine *s);
> diff --git a/drivers/md/persistent-data/dm-btree-spine.c b/drivers/md/persistent-data/dm-btree-spine.c
> index b27b8091a1ca..e03cb9e48773 100644
> --- a/drivers/md/persistent-data/dm-btree-spine.c
> +++ b/drivers/md/persistent-data/dm-btree-spine.c
> @@ -132,15 +132,13 @@ void init_ro_spine(struct ro_spine *s, struct dm_btree_info *info)
>  	s->nodes[1] = NULL;
>  }
> 
> -int exit_ro_spine(struct ro_spine *s)
> +void exit_ro_spine(struct ro_spine *s)
>  {
> -	int r = 0, i;
> +	int i;
> 
>  	for (i = 0; i < s->count; i++) {
>  		unlock_block(s->info, s->nodes[i]);
>  	}
> -
> -	return r;
>  }
> 
>  int ro_step(struct ro_spine *s, dm_block_t new_child)
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

