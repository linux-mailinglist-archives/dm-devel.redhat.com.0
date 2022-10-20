Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA881605A4F
	for <lists+dm-devel@lfdr.de>; Thu, 20 Oct 2022 10:54:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666256044;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7nwk/D7DIaWxoEWu8C12JgZMZ6ramOyr8+AFPno0+9M=;
	b=I9YwcEvpvaIPPrmBf4v7PCbCWfQF3b6FKRB6yKjkZlXT2mPI+WqwFqHQyNVLmlJ9w9ccMT
	H3svQBe2j+wGiS41bgblOgU1QahzcgmTX0gxZWIT18UUw8GX1rFLtiza32XQLMgIbRU32y
	pY1JwCQ0qA1MSJVCxu+PAoI3N1ACuTE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-XzR8TCSDOp2YKpbrKlBIgg-1; Thu, 20 Oct 2022 04:54:03 -0400
X-MC-Unique: XzR8TCSDOp2YKpbrKlBIgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DBE0864760;
	Thu, 20 Oct 2022 08:54:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF1DA40CA41E;
	Thu, 20 Oct 2022 08:53:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A28919465A8;
	Thu, 20 Oct 2022 08:53:57 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A71A1946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 20 Oct 2022 08:53:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 31400111E3E9; Thu, 20 Oct 2022 08:53:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 295CA1121330
 for <dm-devel@redhat.com>; Thu, 20 Oct 2022 08:53:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08665101A54E
 for <dm-devel@redhat.com>; Thu, 20 Oct 2022 08:53:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-DTl-IffkMdKDtlPu6-7Qtg-1; Thu, 20 Oct 2022 04:53:50 -0400
X-MC-Unique: DTl-IffkMdKDtlPu6-7Qtg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1olQij-00C7O0-B7; Thu, 20 Oct 2022 08:16:05 +0000
Date: Thu, 20 Oct 2022 01:16:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <Y1EDxZvjEi47iWUN@infradead.org>
References: <Y07SYs98z5VNxdZq@redhat.com> <Y07twbDIVgEnPsFn@infradead.org>
 <Y0704chr07nUgx3X@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y0704chr07nUgx3X@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [git pull] device mapper changes for 6.1
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
Cc: linux-block@vger.kernel.org, Shaomin Deng <dengshaomin@cdjrlc.com>,
 Nikos Tsironis <ntsironis@arrikto.com>, Mike Snitzer <snitzer@kernel.org>,
 Nathan Huckleberry <nhuck@google.com>, Christoph Hellwig <hch@infradead.org>,
 dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
 Genjian Zhang <zhanggenjian@kylinos.cn>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Milan Broz <gmazyland@gmail.com>, Alasdair G Kergon <agk@redhat.com>,
 Jiangshan Yi <yijiangshan@kylinos.cn>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 18, 2022 at 02:48:01PM -0400, Mike Snitzer wrote:
> > That really does not sound like a good idea at all.  And it does not
> > seem to have any MM or core maintainer signoffs.
> 
> Sorry, I should've solicited proper review more loudly.
> 
> But if you have a specific concern with how DM is looking to use
> is_vmalloc_or_module_addr() please say what that is.

If I understand the patch correct it tries to use it to detect if
a string is a string global.  Besides being nasty API abuse I can't
see how this would even work if DM is built in.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

