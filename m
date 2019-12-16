Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 882A91211C7
	for <lists+dm-devel@lfdr.de>; Mon, 16 Dec 2019 18:33:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576517583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wXWLreNXEmldIWFvRIWtrxBwLHCOQgG0cGtTbcmNAyo=;
	b=BWiZGM5YHsqUtmX7yMIHRUSosSlqb5GLWrAfM/bDyxtxlKlhqFXo/jJ2RXBNOS/PGwARUB
	PuXqrc8Uea/9DHk4jG7f02TxL8r2vGjIl8SAkzP5wF6Eg7CHkan/m2/oZsdftyb/UwPaNy
	ingUC0wDTC4xKVZIMU05Io9uV7BbiUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-DCVxI3rLMoueHFXOn2RAEw-1; Mon, 16 Dec 2019 12:33:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD7DF107ACE3;
	Mon, 16 Dec 2019 17:32:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 057455C28D;
	Mon, 16 Dec 2019 17:32:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0128918089C8;
	Mon, 16 Dec 2019 17:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBGHWOxl016665 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Dec 2019 12:32:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC4B5215AB0A; Mon, 16 Dec 2019 17:32:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6428215AB05
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 17:32:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B79C71018C2E
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 17:32:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-266-MZ5_g1nuOpenC0M_sP2BvA-1;
	Mon, 16 Dec 2019 12:32:20 -0500
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 27D2D206E0;
	Mon, 16 Dec 2019 17:32:19 +0000 (UTC)
Date: Mon, 16 Dec 2019 09:32:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Xu Zaibo <xuzaibo@huawei.com>
Message-ID: <20191216173217.GD139479@gmail.com>
References: <7a4edfcb-c140-bf1b-c674-dbb1b30f9b07@huawei.com>
MIME-Version: 1.0
In-Reply-To: <7a4edfcb-c140-bf1b-c674-dbb1b30f9b07@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: MZ5_g1nuOpenC0M_sP2BvA-1
X-MC-Unique: DCVxI3rLMoueHFXOn2RAEw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBGHWOxl016665
X-loop: dm-devel@redhat.com
Cc: forest.zhouchang@huawei.com, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, zhangwei375@huawei.com
Subject: Re: [dm-devel] [Question] Confusion of the meaning for encrypto
 API's return value
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 16, 2019 at 03:18:54PM +0800, Xu Zaibo wrote:
> Hi,
> 
> I get a confusion.
> 
> According to my understanding, That 'crypto_skcipher_encrypt(request)'
> returns '-EBUSY '
> 
> means the caller should call this API again with the request. However, as my
> knowledge in
> 
> 'dm-crypt', this means the caller need not call this request again, because
> 'dm-crypt' thinks
> 
> that the driver of 'crypto_skcipher_encrypt' will send the request again as
> it is not busy.
> 
>    So, my question is: what's the meaning of
> 'crypto_skcipher_encrypt(request)' returning '-EBUSY '?
> 
> 
> Cheers,
> 

-EBUSY means that the request was put on the backlog.  It will still be
completed eventually.

- Eric


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

