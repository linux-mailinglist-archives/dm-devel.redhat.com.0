Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4CF35C6CF
	for <lists+dm-devel@lfdr.de>; Mon, 12 Apr 2021 14:56:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-fSLHnXJ8PdmtoLTJ464WSw-1; Mon, 12 Apr 2021 08:56:18 -0400
X-MC-Unique: fSLHnXJ8PdmtoLTJ464WSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B4C83DD2D;
	Mon, 12 Apr 2021 12:56:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 802FC19D80;
	Mon, 12 Apr 2021 12:56:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03D6044A5A;
	Mon, 12 Apr 2021 12:55:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CCr0wq015468 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 08:53:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E88C49B01; Mon, 12 Apr 2021 12:53:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 680F147CEA
	for <dm-devel@redhat.com>; Mon, 12 Apr 2021 12:52:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 006D285A5A8
	for <dm-devel@redhat.com>; Mon, 12 Apr 2021 12:52:57 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-34--B6tj5RgMDammRn6ZIfbcw-1; Mon, 12 Apr 2021 08:52:55 -0400
X-MC-Unique: -B6tj5RgMDammRn6ZIfbcw-1
Received: by mail-pj1-f44.google.com with SMTP id t23so6585415pjy.3
	for <dm-devel@redhat.com>; Mon, 12 Apr 2021 05:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OCA7mv5qC5017rl8fdArjmg8eI3IwufSfeA2oRPttk8=;
	b=r9+zN262SRuvccTyWIzCxg5lltFpKsfvvm0IueUV0NdJUga1nVBahosxVs5lD9lTkX
	JjRSo4ebvnVzOq6y9qedrHfVYPk68yjj1iNa6GQu+e23vzV7EB14lkQl8jh4R7uMKtPK
	OzUX1s3jPU9GA6CBuoAkYIZuuoMyDXM42wLuCVJgZpUcJn5FCbNZj0V0Of4GyMJztV94
	O1IBn/cQdVSMymALcNlQRhigbgTx3mMKlDRTXz36JHKxPHf3x1i+MdPfwDV1beRLLoc7
	WGjwutQOn7Bfjazfjf9Hw69HyCV/6pUdw7Yp0ou0GzrIkQeiIu497bRVzvNHl31GGesl
	OeUg==
X-Gm-Message-State: AOAM533f2CXnU7bo9UwNnHlNYbXhY4Os0OvJ3qGCp/Ne5/Gl/srkwfXQ
	3y1xdaSWIUJhwv+Q2op07bIe4g==
X-Google-Smtp-Source: ABdhPJzLeLhBK66Nk4wwr1Qi+u5TGbrkSfojT0jims78QJOK4i1N/PgGldHlpVMOayemChkC/u0Vvw==
X-Received: by 2002:a17:90a:e54c:: with SMTP id
	ei12mr21732716pjb.164.1618231973836; 
	Mon, 12 Apr 2021 05:52:53 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id
	t12sm11687259pga.85.2021.04.12.05.52.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 12 Apr 2021 05:52:53 -0700 (PDT)
To: Ming Lei <ming.lei@redhat.com>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-11-ming.lei@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <8ba2f989-8294-cdf1-09a8-11cae5f4f03e@kernel.dk>
Date: Mon, 12 Apr 2021 06:52:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210401021927.343727-11-ming.lei@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH V5 10/12] block: add queue_to_disk() to get
 gendisk from request_queue
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/31/21 8:19 PM, Ming Lei wrote:
> From: Jeffle Xu <jefflexu@linux.alibaba.com>
> 
> Sometimes we need to get the corresponding gendisk from request_queue.
> 
> It is preferred that block drivers store private data in
> gendisk->private_data rather than request_queue->queuedata, e.g. see:
> commit c4a59c4e5db3 ("dm: stop using ->queuedata").
> 
> So if only request_queue is given, we need to get its corresponding
> gendisk to get the private data stored in that gendisk.

Applied this one as a separate cleanup/helper.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

