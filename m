Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A9A132435B0
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 10:03:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-60HBlJsfP6O5S0Z6ggwRYQ-1; Thu, 13 Aug 2020 04:03:30 -0400
X-MC-Unique: 60HBlJsfP6O5S0Z6ggwRYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6532B8014D8;
	Thu, 13 Aug 2020 08:03:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C26C100AE53;
	Thu, 13 Aug 2020 08:03:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F009181A06B;
	Thu, 13 Aug 2020 08:03:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07D81DF7012747 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 04:01:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4122F201828D; Thu, 13 Aug 2020 08:01:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9D22018283
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 08:01:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A7F811E79
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 08:01:10 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-366-1DROKCVBMauip0dNFXKkmA-1; Thu, 13 Aug 2020 04:01:05 -0400
X-MC-Unique: 1DROKCVBMauip0dNFXKkmA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 11127A9D74D51C979AAA;
	Thu, 13 Aug 2020 16:00:59 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 13 Aug 2020
	16:00:50 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <dm-devel@redhat.com>
References: <c6ff6ae5-8b58-4beb-b6c9-10db444ffce2@huawei.com>
	<109bd950021918cce1c89d0e92d137ffa6336ea2.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <c074551f-ae1f-ea69-a012-95777007b1b5@huawei.com>
Date: Thu, 13 Aug 2020 16:00:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <109bd950021918cce1c89d0e92d137ffa6336ea2.camel@suse.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: Re: [dm-devel] [PATCH V2] libmultipath: fix a memory leak in
 set_ble_device
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi  Martin
   I'm sorry for send  "[PATCH V3] libmultipath: fix a memory leak in set_ble_device"
to you  before finishing compile. Here is some question in ble->vendor_reg = NULL.
The type of ble->vendor_reg is regex_t but not void *, so it can not be set to
NULL. Do you have any good idea about how to set ble->vendor_reg. You can ignore
the email [PATCH V3] libmultipath: fix a memory leak in set_ble_device.

Lixiaokeng


> Thinking about it again, I believe the error handling code should look
> like this:
> 
>  out1:
>         if (vendor) {
>                 regfree(&ble->vendor_reg);
>                 ble->vendor_reg = NULL;
>                 ble->vendor = NULL;
>         }
>  out:
>         free(vendor_str);
>         free(product_str);
> 	return 1;
> 
> Rationale: vendor_str and product_str are local variables, there's no
> point in setting them to NULL. But the ble fields need careful
> treatment, as vendor and product can either be set in a single call of
> this function, or in two separate calls. You should test "vendor"
> rather than "vendor_str" in the "out1" clause to make this logic
> obvious, even though you never pass "out1" if allocating vendor_str
> failed.
> 
> Note the regfree() I added. It's missing in the current code as well.
> 
> Regards,
> Martin
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

