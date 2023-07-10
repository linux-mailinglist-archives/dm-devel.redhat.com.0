Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6C474DDBA
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jul 2023 21:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689015921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5861KWD3d/dGpI//8v3IKMqr0tZlob26W8VkqiCD28M=;
	b=KB/GdLjp8EIWoNO2yi5vN2d0IjteCsZXkQkxZq2mBBl+xVIKhs5b3qtOz/SU9RpJLGd2n/
	1yFmxL4pZ7ksA+AM14FDt1E0D5kY433GlQGewBq6w2MG+Gg0JO4tHgLYuk24uj48WhRbwx
	qciI1/TTTYGyHry3WQ8nBsoMWkX5C7E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-bmUZA5nCP0aMo0WpEK6f0g-1; Mon, 10 Jul 2023 15:05:19 -0400
X-MC-Unique: bmUZA5nCP0aMo0WpEK6f0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30B06381494A;
	Mon, 10 Jul 2023 19:05:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2C5AC52D9C;
	Mon, 10 Jul 2023 19:05:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F143819451E2;
	Mon, 10 Jul 2023 19:05:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D553319465B8
 for <dm-devel@listman.corp.redhat.com>; Mon, 10 Jul 2023 19:05:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9BC41C478DE; Mon, 10 Jul 2023 19:05:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92ED8C09A09
 for <dm-devel@redhat.com>; Mon, 10 Jul 2023 19:05:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7110380269A
 for <dm-devel@redhat.com>; Mon, 10 Jul 2023 19:05:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-wUDXNPaeOx-GQa4eYEjN6g-1; Mon, 10 Jul 2023 15:05:03 -0400
X-MC-Unique: wUDXNPaeOx-GQa4eYEjN6g-1
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so1265135b3a.1
 for <dm-devel@redhat.com>; Mon, 10 Jul 2023 12:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689015902; x=1691607902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aWV26TGTy3//l4E8aINjjrrFmjWk+bhHVAYRbt8sCmU=;
 b=axGN74ZV5zDAPmQXvTboo1nxgyfSPYnhI2Cz70ZYxsYaa0GKg/tRkmrRtaSmyeDCPH
 eeIJJMKT5wFpJc/BOagKksiS8fwqoakMcO6ffDwgiFBjRj3obJqKCkYC08JTYPQQHzyP
 kVC1+2dbmrGl57nzrmpEcuBRApwVmCKpdL3+c/30kjnf6941HQfIwYbCS4HmiZuXbA6A
 hccXaguKmnbukcQ6sETCDXFkWxKfNPDc87A2DXjwFjCB0kwb0dzs2vHJFN3Fk+vusyX9
 sTL8vgvpVC+xfnkqpxxWOquu3M+3REhpqa3vQY3QRo7Q/mLxHSj0wwbYR5ixMwPXCI1s
 VV6Q==
X-Gm-Message-State: ABy/qLahkRrCYE8y4POfNI1JUE+vigsvwvgH4oFlpdbv/n9j7Pk10JY7
 qPNR15UPC3UbP2jfNmUmaV5+YA==
X-Google-Smtp-Source: APBJJlEiIWLxcSKnACk8shroBBJlI/U6S4QvWokhBzawLykUkcAHFBh46fnGScu9KFgpew7U4EXhlQ==
X-Received: by 2002:a17:902:ea0a:b0:1b3:ec39:f42c with SMTP id
 s10-20020a170902ea0a00b001b3ec39f42cmr17068822plg.5.1689015902396; 
 Mon, 10 Jul 2023 12:05:02 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a170902724300b001b1c3542f57sm241949pll.103.2023.07.10.12.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 12:05:01 -0700 (PDT)
Message-ID: <2ade2716-d875-5e4c-82ce-c4c7f00f1bbc@kernel.dk>
Date: Mon, 10 Jul 2023 13:05:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Mikulas Patocka <mpatocka@redhat.com>, Li Nan <linan666@huaweicloud.com>
References: <alpine.LRH.2.02.2209201350470.26058@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2209201358120.26535@file01.intranet.prod.int.rdu2.redhat.com>
 <ace0451f-b979-be13-cf47-a8cb3656c72e@huaweicloud.com>
 <4b6788d2-c6e1-948-22d-dbb7cbba657d@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <4b6788d2-c6e1-948-22d-dbb7cbba657d@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.dk
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/10/23 9:24?AM, Mikulas Patocka wrote:
> 
> 
> On Mon, 10 Jul 2023, Li Nan wrote:
> 
>> Hi, Mikulas
>>
>> The lack of discard in ramdisk can cause some issues related to dm. see:
>> https://lore.kernel.org/all/20220228141354.1091687-1-luomeng12@huawei.com/
>>
>> I noticed that your patch series has already supported discard for brd. But
>> this patch series has not been applied to mainline at present, may I ask if
>> you still plan to continue working on it?
>>
>> -- 
>> Thanks,
>> Nan
> 
> Hi
> 
> I got no response from ramdisk maintainer Jens Axboe. We should ask him, 
> whether he doesn't want discard on ramdisk at all or whether he wants it.

When a series is posted and reviewers comment on required changes, I
always wait for a respin of that series with those addressed. That
didn't happen, so this didn't get applied.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

