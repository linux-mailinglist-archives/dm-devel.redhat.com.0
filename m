Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC4F20F679
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 15:59:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-RnNdlDOwP2ue1zEUR0SyvA-1; Tue, 30 Jun 2020 09:59:15 -0400
X-MC-Unique: RnNdlDOwP2ue1zEUR0SyvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 689351399E6;
	Tue, 30 Jun 2020 13:57:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 401A67BEDA;
	Tue, 30 Jun 2020 13:57:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4D93180954D;
	Tue, 30 Jun 2020 13:57:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UDvmXQ026059 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 09:57:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA5D3122D7D; Tue, 30 Jun 2020 13:57:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F4E122D5A
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 13:57:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24F981033656
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 13:57:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-WkUl7auNMDKAd8oQ_LEsqw-1; Tue, 30 Jun 2020 09:57:33 -0400
X-MC-Unique: WkUl7auNMDKAd8oQ_LEsqw-1
Received: by mail-pl1-f178.google.com with SMTP id bj10so3281154plb.11
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 06:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6WoGClip/9lIMADlW96b66URAMpf8agavloV0J0+6z0=;
	b=hoezKKKMwONB9QTcYyyhEMfznV6xgvI/mSODFGsCVe0+LxlPMdThVbpHFj+1N+2mrY
	xXkBfeSkPWDrWM8QksPnfDyMWFOOiyJP3V9UlU+ygm4KAn5BgopcIm0eml1Mv+pPur+e
	wV9Gz8rly360jknzeNGJmy4YyO8aAWBuEB69SL3OcAimJOJRCI1U3MpiLpHSKEQmRuaF
	uqOJSlDJQxdfMFLhOp0YG7ZY9d7Yi95oH675hDJEWFMOh3eFqcdhL/RlgP2nBbca1Gj/
	FLSXNvLdq0x44ZRxUYtrycyj3674dXKn8mduPK+zlnu5oO97q9cHUPS7JgytOXVALI0I
	Evlw==
X-Gm-Message-State: AOAM531XW9TxT1KYbSCJeP3NLh4aNScnmV/xmGiD9uWC7mYrmfFM2cXC
	7O+8GtGpCIM6QwAOWmZIbHceUw==
X-Google-Smtp-Source: ABdhPJxkJrJtaSOyTXzA8zW0V7qLT6cuFQyL+FUGsc5/cLMGVxoMFOJShXuR+F2LWbUj8PAuD022LQ==
X-Received: by 2002:a17:90a:ec13:: with SMTP id
	l19mr20004827pjy.81.1593525452289; 
	Tue, 30 Jun 2020 06:57:32 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:4113:50ea:3eb3:a39b?
	([2605:e000:100e:8c61:4113:50ea:3eb3:a39b])
	by smtp.gmail.com with ESMTPSA id
	m140sm2896019pfd.195.2020.06.30.06.57.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 30 Jun 2020 06:57:31 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
Date: Tue, 30 Jun 2020 07:57:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] rename ->make_request_fn and move it to the
 block_device_operations
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/29/20 1:39 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series moves the make_request_fn method into block_device_operations
> with the much more descriptive ->submit_bio name.  It then also gives
> generic_make_request a more descriptive name, and further optimize the
> path to issue to blk-mq, removing the need for the direct_make_request
> bypass.

Looks good to me, and it's a nice cleanup as well. Applied.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

