Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5D6A793B
	for <lists+dm-devel@lfdr.de>; Thu,  2 Mar 2023 02:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677722268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LenxP9R42t/8IiadVZkp2RifsfUjBmEdltBKJBoqztM=;
	b=PjMW4W3pU+jIEVyNUwGH0Qr9WB2++Ne29vTRMm8nDYTefOMTpilACbMm9X1wNd7cm9pb8z
	/3mI+6rKsrDu7DIwPvpFBtVK1EkJh4pV8sxePNBDs+cwX953+96iYnsO+x6nCNQr4akQqb
	0t+RXUlk985dgShEzItNhDZslDScsNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-Rj5KZlgtOu-ZC9zREJsmkw-1; Wed, 01 Mar 2023 20:57:46 -0500
X-MC-Unique: Rj5KZlgtOu-ZC9zREJsmkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D421101A521;
	Thu,  2 Mar 2023 01:57:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0FAE1121315;
	Thu,  2 Mar 2023 01:57:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DC6D1948644;
	Thu,  2 Mar 2023 01:57:26 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5859B19472FC
 for <dm-devel@listman.corp.redhat.com>; Thu,  2 Mar 2023 01:57:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4500E492B01; Thu,  2 Mar 2023 01:57:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-26.pek2.redhat.com [10.72.8.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FAF2492C3E;
 Thu,  2 Mar 2023 01:57:18 +0000 (UTC)
Date: Thu, 2 Mar 2023 09:57:13 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Uday Shankar <ushankar@purestorage.com>
Message-ID: <ZAACeb0/Pfw8XN3a@T590>
References: <20230301000655.48112-1-ushankar@purestorage.com>
MIME-Version: 1.0
In-Reply-To: <20230301000655.48112-1-ushankar@purestorage.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH v3] blk-mq: enforce op-specific segment
 limits in blk_insert_cloned_request
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Mike Snitzer <snitzer@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
 Keith Busch <kbusch@kernel.org>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 28, 2023 at 05:06:55PM -0700, Uday Shankar wrote:
> The block layer might merge together discard requests up until the
> max_discard_segments limit is hit, but blk_insert_cloned_request checks
> the segment count against max_segments regardless of the req op. This
> can result in errors like the following when discards are issued through
> a DM device and max_discard_segments exceeds max_segments for the queue
> of the chosen underlying device.
> 
> blk_insert_cloned_request: over max segments limit. (256 > 129)
> 
> Fix this by looking at the req_op and enforcing the appropriate segment
> limit - max_discard_segments for REQ_OP_DISCARDs and max_segments for
> everything else.
> 
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,
Ming
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

