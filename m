Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2D701210C7B
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 15:44:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-qtxFcBlAPC-d1W21MppR_g-1; Wed, 01 Jul 2020 09:44:17 -0400
X-MC-Unique: qtxFcBlAPC-d1W21MppR_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A6D8106B21B;
	Wed,  1 Jul 2020 13:44:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1CFF5DC1E;
	Wed,  1 Jul 2020 13:44:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 499646C9C6;
	Wed,  1 Jul 2020 13:43:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061DhcDs019875 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 09:43:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 337882028CD2; Wed,  1 Jul 2020 13:43:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B673202A97E
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 13:43:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 481A48EF3B1
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 13:43:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-486-cJ1yongOO2KRVFlqOkUNrQ-1; Wed, 01 Jul 2020 09:43:32 -0400
X-MC-Unique: cJ1yongOO2KRVFlqOkUNrQ-1
Received: by mail-pl1-f180.google.com with SMTP id x8so9039075plm.10
	for <dm-devel@redhat.com>; Wed, 01 Jul 2020 06:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mp3kZB+WljYlToUgRKHu/jMatrXibHPg1FspuaVdS+E=;
	b=eTx5MxcOx4AV2bPtlG8eaNb/VqLykOemSAS9x8W2KOAN96Fhu3SSkWuwChKR9Uler6
	QJ0urGegaFIMswD8dOqyBLaQge3tRnrds4KDdmhczcO1R/ahc7eg3tMjBwQkzODjepQs
	/jC+rVVmbES0LH2wEpppxEbmqS0HwDQBv0sOrpjN9sKWmsiKA1bUy+7jHH+dreq0AL0R
	6GAHdKSSqXqkYe9EbfYT5Ua0yb7uZZOzza5E0V7AOe/crblvv+uTSJ3H8dDZ9bZxzDoq
	E+UAqp69iV783Y/7E7J/IvNbIL2a8l3KX0jr13htHARBXXFrHvf8aax0Dc8XoxARB7Be
	d99A==
X-Gm-Message-State: AOAM530kBVNDXTLQJKPcA/IWIIBx90muBCza1IYsl7cUez9PEBZOxEKG
	ihMz2faxI9Uvnv7d8J2gnmrg7w==
X-Google-Smtp-Source: ABdhPJwvetMLus+odkxVKs2TAwFJf3HuNkqQjK/vuqbHNuGPdXyOvoQGErv/SGur7kel3VcwfskpPQ==
X-Received: by 2002:a17:902:690b:: with SMTP id
	j11mr14712438plk.313.1593611011686; 
	Wed, 01 Jul 2020 06:43:31 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:64c1:67b1:df51:2fa8?
	([2605:e000:100e:8c61:64c1:67b1:df51:2fa8])
	by smtp.gmail.com with ESMTPSA id g4sm5868990pfi.68.2020.07.01.06.43.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 01 Jul 2020 06:43:31 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200701085947.3354405-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <bffb89d5-b51a-5f5a-15f4-b891f1f053ef@kernel.dk>
Date: Wed, 1 Jul 2020 07:43:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701085947.3354405-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] rename ->make_request_fn and move it to the
 block_device_operations v2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/1/20 2:59 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series moves the make_request_fn method into block_device_operations
> with the much more descriptive ->submit_bio name.  It then also gives
> generic_make_request a more descriptive name, and further optimize the
> path to issue to blk-mq, removing the need for the direct_make_request
> bypass.

Thanks, I'll try this again.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

