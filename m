Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 040765E705E
	for <lists+dm-devel@lfdr.de>; Fri, 23 Sep 2022 01:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663890986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cYI8ef0oQpJZ3Gjtn0XkuEZ/4brA+MrPFj0i9KWz364=;
	b=cuv0PeOGs79N9y3SQlGXCD3gvGW6orW8cKNLyIHjwgVgNgs2OvZtlRh8CZbRq/ABc8r65d
	WZkPHtkCUUCDJ9KCOHuMhmfOzIjoS5fFb5g4WLGYvd1bASDYPVu8aZG/bcK5G/buHc3J9m
	BJBzYFwPRXRb3HgVIj9FZaBc9nLMOzA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-hkNxODYwOsaV59SkstYL8A-1; Thu, 22 Sep 2022 19:56:22 -0400
X-MC-Unique: hkNxODYwOsaV59SkstYL8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D692185A59D;
	Thu, 22 Sep 2022 23:56:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90B1540C6EC3;
	Thu, 22 Sep 2022 23:56:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 530C41946A5A;
	Thu, 22 Sep 2022 23:56:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B5F8119465A4
 for <dm-devel@listman.corp.redhat.com>; Thu, 22 Sep 2022 23:56:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A14BB492B05; Thu, 22 Sep 2022 23:56:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99191492B04
 for <dm-devel@redhat.com>; Thu, 22 Sep 2022 23:56:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7616A85A583
 for <dm-devel@redhat.com>; Thu, 22 Sep 2022 23:56:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-D5lAjC_bPgymXj4_2S7wmQ-1; Thu, 22 Sep 2022 19:56:13 -0400
X-MC-Unique: D5lAjC_bPgymXj4_2S7wmQ-1
Received: by mail-pl1-f173.google.com with SMTP id f23so10275011plr.6;
 Thu, 22 Sep 2022 16:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=W2+hY5lHfF8Yuo41plQsF/0eXxPmqJupnSDFH4YELL4=;
 b=2bVs83IFaVlk1c7VaNv/NCnCVSZ/KPLWKk2E9qxWvs+rK0p9uPwa1ZmHjczelP9r5D
 DTDRvZ9lUsKphF6G0CfpxLc52fS8LfmOw++L1xFiRXKo3BSRorCeGwsI/f22k4NiCrmJ
 mZ/sSNTN0JdKBJt+i4m0bzmN2H+Pf9tVHkAYXKOPtMNQhiPosBTIVUTmg8mCxS2O3NW8
 MLNxo90/tiseX/CAtLe/J9N/E1aoDaVIqsM5DD0G2Tw7EBukFrvGXIqUgU9EnYPWx+xP
 D4QgZ/1rCbnJXaEypcU/oaSA6u4xJD8JMPKVxemE99FBS9bnSogZexSgaRaKY0og3ts2
 /8zQ==
X-Gm-Message-State: ACrzQf3l75jT8hJvHVBzO8nifG18GzZaejMZCGDndu8SPMTvb87XiKmH
 agun1hwoi1I38ODqs/gQOWaIfTVYv2E=
X-Google-Smtp-Source: AMsMyM7DnGl8Usys7cprZQSwOFa/NlnQp69DKqLnRIqNLOSTU/oMTFEKEH4OrfofFw1WRmQVRwtsKg==
X-Received: by 2002:a17:902:d58f:b0:179:b756:6f5e with SMTP id
 k15-20020a170902d58f00b00179b7566f5emr4818263plh.1.1663890971926; 
 Thu, 22 Sep 2022 16:56:11 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170903124a00b001782a0d3eeasm4698194plh.115.2022.09.22.16.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 16:56:10 -0700 (PDT)
Message-ID: <8fd1d8b1-9f43-eb03-4a7f-187723d1c483@acm.org>
Date: Thu, 22 Sep 2022 16:56:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mike Snitzer <snitzer@redhat.com>, Pankaj Raghav <p.raghav@samsung.com>
References: <CGME20220920091120eucas1p2c82c18f552d6298d24547cba2f70b7fc@eucas1p2.samsung.com>
 <20220920091119.115879-1-p.raghav@samsung.com> <YytJhEywBhqcr7MX@redhat.com>
 <7dd9dbc0-b08b-fa47-5452-d448d86ca56b@opensource.wdc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <7dd9dbc0-b08b-fa47-5452-d448d86ca56b@opensource.wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] Please further explain Linux's "zoned storage"
 roadmap [was: Re: [PATCH v14 00/13] support zoned block devices with
 non-power-of-2 zone sizes]
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
Cc: axboe@kernel.dk, pankydev8@gmail.com, gost.dev@samsung.com,
 snitzer@kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, matias.bjorling@wdc.com, Johannes.Thumshirn@wdc.com,
 jaegeuk@kernel.org, hch@lst.de, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 9/21/22 16:55, Damien Le Moal wrote:
> But again, that all depends on if Pankaj patch series is accepted, that
> is, on everybody accepting that we lift the power-of-2 zone size constraint.

The companies that are busy with implementing zoned storage for UFS 
devices are asking for kernel support for non-power-of-2 zone sizes.

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

