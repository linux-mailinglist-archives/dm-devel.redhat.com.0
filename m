Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE05EE402
	for <lists+dm-devel@lfdr.de>; Wed, 28 Sep 2022 20:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664388769;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aRP680z38AUKuf+r+3p2Kx9gwISiR9cgWc47HlABui8=;
	b=euwZMdCG/JCzTKnhS8KtYMlZvqptrgPfh7807uU6NJsIi3TVq8ZRN0EWdMHwR1CC+7tO3Q
	a9BOYy5bJ5HjLivdss2OaVIQ58TRchiUkMovlbdnsKCdY/CNsqAMA65TTKSVKLJ9CPsxTI
	LZAtdFPCVtIv9ql2g5nCU6/p4SYtnu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-izr0I0CvNl6A8K1eh_LYNg-1; Wed, 28 Sep 2022 14:12:47 -0400
X-MC-Unique: izr0I0CvNl6A8K1eh_LYNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D131811E81;
	Wed, 28 Sep 2022 18:12:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC5BA492CA2;
	Wed, 28 Sep 2022 18:12:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 572351946A4E;
	Wed, 28 Sep 2022 18:12:38 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 62F5E194658F
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Sep 2022 18:11:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3FF9A140EBF5; Wed, 28 Sep 2022 18:11:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 392BF140EBF4
 for <dm-devel@redhat.com>; Wed, 28 Sep 2022 18:11:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E76F029DD99A
 for <dm-devel@redhat.com>; Wed, 28 Sep 2022 18:10:59 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-zbbwnQWsMImPBt0tKE7XoA-1; Wed, 28 Sep 2022 14:10:57 -0400
X-MC-Unique: zbbwnQWsMImPBt0tKE7XoA-1
Received: by mail-pj1-f43.google.com with SMTP id
 8-20020a17090a0b8800b00205d8564b11so2367752pjr.5; 
 Wed, 28 Sep 2022 11:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GKDnwlvt98AzYvx8t1Z5mBjBPM9OSikHPq+0SvL9Y6w=;
 b=kFWDXce1DISEDukhqAEak3B9tcWrQo0uNFJdhdNcPcEitUi+gLd9n2IREV/BDpYuDu
 tQtb77t1USZ8+Hnf0NxG4kc+u0YpDOQt9SkZr/DPOjdJ72F9c93Bl34hUEmyxmghAp3H
 8KYAq/BPoNm2BEpP7e3if6akBEpQ/0TEMweTE7We0MQsSSY/WwGlD/bKhYilJRvm4uRi
 fTHZggEnCjdennmbMTMJ/CRM7LuhULywCVT+p54VTUSxc5hRTqOnG0aBMMySDVmtYjPv
 U3B4B9WPD1jLNoleAhv+Q/cZEt31UMmitDEBwnSaeYKEncgb4J8GjoVwtYIDLUQbG+DW
 iWPg==
X-Gm-Message-State: ACrzQf3yEYt3p8LhXzaWsav8m8Tp1EqrFIL2MEF5O1SEO2qyzihd3vWr
 cD/itblXdmiCfYZQ11zLj9A=
X-Google-Smtp-Source: AMsMyM6IxpfaBJs42tePmX0Cj6OVnmn2lb9A/fUs5CG7m7PAuLn3yEE2tGgbRAOQDk0DKNCAQZzakQ==
X-Received: by 2002:a17:902:ea12:b0:178:8e76:c781 with SMTP id
 s18-20020a170902ea1200b001788e76c781mr1044864plg.136.1664388656275; 
 Wed, 28 Sep 2022 11:10:56 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:4cba:f1a9:6ef8:3759?
 ([2620:15c:211:201:4cba:f1a9:6ef8:3759])
 by smtp.gmail.com with ESMTPSA id
 i132-20020a62878a000000b0053651308a1csm4352316pfe.195.2022.09.28.11.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 11:10:55 -0700 (PDT)
Message-ID: <26566e80-bf67-8c9f-9aac-b636cfaf473c@acm.org>
Date: Wed, 28 Sep 2022 11:10:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Pankaj Raghav <p.raghav@samsung.com>, snitzer@kernel.org,
 axboe@kernel.dk, agk@redhat.com, hch@lst.de, damien.lemoal@opensource.wdc.com
References: <20220923173618.6899-1-p.raghav@samsung.com>
 <CGME20220923173627eucas1p2f134d9cb331e4a8f0fca8431eeb0f0b0@eucas1p2.samsung.com>
 <20220923173618.6899-8-p.raghav@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220923173618.6899-8-p.raghav@samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH v15 07/13] zonefs: allow non power of 2 zoned
 devices
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
Cc: Chaitanya Kulkarni <kch@nvidia.com>, pankydev8@gmail.com,
 Johannes.Thumshirn@wdc.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, gost.dev@samsung.com, jaegeuk@kernel.org,
 matias.bjorling@wdc.com, Luis Chamberlain <mcgrof@kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 9/23/22 10:36, Pankaj Raghav wrote:
> The zone size shift variable is useful only if the zone sizes are known
> to be power of 2. Remove that variable and use generic helpers from
> block layer to calculate zone index in zonefs.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

