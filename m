Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFEE75A705
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jul 2023 08:57:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689836221;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7D6BSbM3xcZer3tNNsMYO2wT2vxyjYavaZluwL+AR4Q=;
	b=XpxWi70SUGci0LHVRv1ljciciGgDvQvK6VQgFDep/ITzf6DV9TS9k/HX5oKOzfqU0BB0AA
	u4EqY8aUJhxXC5Moew3GV9jRY5Ke7pB44jV88i2V3wcwQKW0mFrfQH06BoQndAJiPZt1Cw
	A+9sHxaPpj+Wjyo6K/00NLnKe5MpVMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-BLCdjCPeP1W_Q7uPqXuIxw-1; Thu, 20 Jul 2023 02:56:57 -0400
X-MC-Unique: BLCdjCPeP1W_Q7uPqXuIxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3391B104D517;
	Thu, 20 Jul 2023 06:56:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98EB4F6CD8;
	Thu, 20 Jul 2023 06:56:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B4191946A6A;
	Thu, 20 Jul 2023 06:56:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 493C21946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 20 Jul 2023 06:56:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 396CF492B03; Thu, 20 Jul 2023 06:56:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B3F492B02
 for <dm-devel@redhat.com>; Thu, 20 Jul 2023 06:56:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12826936D2B
 for <dm-devel@redhat.com>; Thu, 20 Jul 2023 06:56:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-DKLFmvT8O9e2wLae-All4g-1; Thu, 20 Jul 2023 02:56:45 -0400
X-MC-Unique: DKLFmvT8O9e2wLae-All4g-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qMMTS-009qv7-1o; Thu, 20 Jul 2023 05:45:14 +0000
Date: Wed, 19 Jul 2023 22:45:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <ZLjJ6nU1YjlLD+Ay@infradead.org>
References: <3fcf222-4894-992-ae81-c72ca983d82@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3fcf222-4894-992-ae81-c72ca983d82@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH 2/3] brd: enable discard
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 linux-block@vger.kernel.org, Li Nan <linan666@huaweicloud.com>,
 dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +static void brd_free_page_rcu(struct rcu_head *head)
> +{
> +	struct page *page = container_of(head, struct page, rcu_head);
> +	__free_page(page);

Nit: missing empty line here.  Although I see no point in the local
variable anyay.

> +}
> +
> +static void brd_free_page(struct brd_device *brd, sector_t sector)
> +{
> +	struct page *page;
> +	pgoff_t idx;
> +
> +	idx = sector >> PAGE_SECTORS_SHIFT;
> +	page = xa_erase(&brd->brd_pages, idx);
> +
> +	if (page) {
> +		BUG_ON(page->index != idx);
> +		call_rcu(&page->rcu_head, brd_free_page_rcu);
> +	}

Doing one call_rcu per page is horribly inefficient.  Please look into
batching this up.

> +static bool discard = false;
> +module_param(discard, bool, 0444);
> +MODULE_PARM_DESC(discard, "Support discard");

Doing this as a global paramter that can't even be changed at run time
does not feel very user friendly.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

