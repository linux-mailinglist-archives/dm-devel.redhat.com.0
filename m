Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52B6E7C90
	for <lists+dm-devel@lfdr.de>; Wed, 19 Apr 2023 16:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681914433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M1PVOPRPO5VDRrSSu8Vt9TJPHIO7cdjSBWnaHJrd9Lw=;
	b=Du3eK+jVyTIkHpuybEIL1ly/x2iJOafudeXMAXocw/73HpwjHPQSHqCkMS8QxV+69G2iRT
	5Gcgl2Kp60fJsXAD79EiyH4LgvWhdRO4HOJezOsSJje3vWkTQrWfURTxZT7L7Z04ta+0Em
	uxF8XcKi5vCnkh2GpGbZPXPty3xiWVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-59fYId_WOGq4lBo5pr2EAg-1; Wed, 19 Apr 2023 10:27:11 -0400
X-MC-Unique: 59fYId_WOGq4lBo5pr2EAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 669FE185A78F;
	Wed, 19 Apr 2023 14:27:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0E94C16026;
	Wed, 19 Apr 2023 14:27:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6BC919465BA;
	Wed, 19 Apr 2023 14:27:00 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26B7D19465A0
 for <dm-devel@listman.corp.redhat.com>; Wed, 19 Apr 2023 14:19:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12FDA40C201F; Wed, 19 Apr 2023 14:19:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE6A40C2064
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 14:19:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9A2B804194
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 14:19:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-mvFoCkFiPh69Bk5IFXAV-A-1; Wed,
 19 Apr 2023 10:19:36 -0400
X-MC-Unique: mvFoCkFiPh69Bk5IFXAV-A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pp8ed-00DJck-8U; Wed, 19 Apr 2023 14:19:27 +0000
Date: Wed, 19 Apr 2023 15:19:27 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Thumshirn <jth@kernel.org>
Message-ID: <ZD/4b9ZQ1YZRTgHL@casper.infradead.org>
References: <20230419140929.5924-1-jth@kernel.org>
 <20230419140929.5924-20-jth@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230419140929.5924-20-jth@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH v3 19/19] block: mark bio_add_page as
 __must_check
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, linux-mm@kvack.org,
 dm-devel@redhat.com, hch@lst.de, agruenba@redhat.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 kch@nvidia.com, snitzer@kernel.org, ming.lei@redhat.com,
 linux-block@vger.kernel.org, rpeterso@redhat.com, dsterba@suse.com,
 axboe@kernel.dk, linux-raid@vger.kernel.org, damien.lemoal@wdc.com,
 song@kernel.org, johannes.thumshirn@wdc.com, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 19, 2023 at 04:09:29PM +0200, Johannes Thumshirn wrote:
> Now that all users of bio_add_page check for the return value, mark
> bio_add_page as __must_check.

Should probably add __must_check to bio_add_folio too?  If this is
really the way you want to go ... means we also need a
__bio_add_folio().

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

