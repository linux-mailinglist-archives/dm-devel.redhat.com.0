Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97500718127
	for <lists+dm-devel@lfdr.de>; Wed, 31 May 2023 15:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685538725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pm1z+kVqWbjaxGlwDeQFznjeaTJVp/p72ZnOnwk1vd4=;
	b=diS3xJrm3YZkx+k7qB51l4NZt5UHeHGPYdkQPaK1pXhWxKJpl9N7pGx/Yny/DIXdCed6Pj
	cXL1KqEDtQeJDOZLO5ForxmJKt+FE3MGTPS885IMuwYmpVgUfaLe9+Vew4jYv40CGVZxU8
	YVM1zCn8xxbGCA8DRxC6M6Vpsgy2dj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-W8LvTcXgN6K9Q-7tziG8sA-1; Wed, 31 May 2023 09:12:03 -0400
X-MC-Unique: W8LvTcXgN6K9Q-7tziG8sA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16014811E9E;
	Wed, 31 May 2023 13:12:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76B5D140E965;
	Wed, 31 May 2023 13:12:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5BCF19465B6;
	Wed, 31 May 2023 13:11:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 244481946595
 for <dm-devel@listman.corp.redhat.com>; Wed, 31 May 2023 12:32:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B289492B0C; Wed, 31 May 2023 12:32:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63928492B0A
 for <dm-devel@redhat.com>; Wed, 31 May 2023 12:32:13 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47DD1101A53B
 for <dm-devel@redhat.com>; Wed, 31 May 2023 12:32:13 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-PXMN7buzN-226L0PpDXuqQ-1; Wed, 31 May 2023 08:32:07 -0400
X-MC-Unique: PXMN7buzN-226L0PpDXuqQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1F1F968B05; Wed, 31 May 2023 14:32:01 +0200 (CEST)
Date: Wed, 31 May 2023 14:32:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Message-ID: <20230531123200.GA26481@lst.de>
References: <cover.1685532726.git.johannes.thumshirn@wdc.com>
 <7ae4a902e08fe2e90c012ee07aeb35d4aae28373.1685532726.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
In-Reply-To: <7ae4a902e08fe2e90c012ee07aeb35d4aae28373.1685532726.git.johannes.thumshirn@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH v7 17/20] block: mark bio_add_page as
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 gouha7@uniontech.com, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

