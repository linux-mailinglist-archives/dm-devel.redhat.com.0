Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8FC759F70
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jul 2023 22:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689797813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/aD+El7DWGDjM9sTEsBPVBgJnWyS10bKIXrrMrZpjNM=;
	b=AIayCs4Rwxm9YzHT2wRfXVPk9OeI8GWrryAjMSKarslRvzSdynDQxIFSDss+UoLRqOkemP
	qrl5rJtUAG+Eh9Fgquy+1VnakZMYDIKXzvAqIFayNxUU1TJPsdMRkM9VWj/PRQ0//IYWoa
	/m8DQtvT2+3wdT3sGzjjJmiBz4Bn9Fw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-wLUUdJbbMECEeP8wJ1CpLw-1; Wed, 19 Jul 2023 16:16:52 -0400
X-MC-Unique: wLUUdJbbMECEeP8wJ1CpLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E911F1C31C4D;
	Wed, 19 Jul 2023 20:16:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCD3940C206F;
	Wed, 19 Jul 2023 20:16:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 505661946A46;
	Wed, 19 Jul 2023 20:16:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF2BB19465A4
 for <dm-devel@listman.corp.redhat.com>; Wed, 19 Jul 2023 20:14:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD87BC33178; Wed, 19 Jul 2023 20:14:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3DAC2C862;
 Wed, 19 Jul 2023 20:14:57 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 981123096A42; Wed, 19 Jul 2023 20:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 8CFF13F7CF; Wed, 19 Jul 2023 22:14:57 +0200 (CEST)
Date: Wed, 19 Jul 2023 22:14:57 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2ade2716-d875-5e4c-82ce-c4c7f00f1bbc@kernel.dk>
Message-ID: <cbc2e578-51d3-3e75-b61-734117d7fce6@redhat.com>
References: <alpine.LRH.2.02.2209201350470.26058@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2209201358120.26535@file01.intranet.prod.int.rdu2.redhat.com>
 <ace0451f-b979-be13-cf47-a8cb3656c72e@huaweicloud.com>
 <4b6788d2-c6e1-948-22d-dbb7cbba657d@redhat.com>
 <2ade2716-d875-5e4c-82ce-c4c7f00f1bbc@kernel.dk>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH v2 3/4] brd: enable discard
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
Cc: Christoph Hellwig <hch@infradead.org>, Li Nan <linan666@huaweicloud.com>,
 dm-devel@redhat.com, linux-block@vger.kernel.org,
 Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 10 Jul 2023, Jens Axboe wrote:

> When a series is posted and reviewers comment on required changes, I
> always wait for a respin of that series with those addressed. That
> didn't happen, so this didn't get applied.
> 
> -- 
> Jens Axboe

Hi

I updated the brd discard patches so that they apply to the kernel 
6.5-rc1. I'm submitting them for review.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

