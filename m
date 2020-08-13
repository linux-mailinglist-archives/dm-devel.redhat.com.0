Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D9F2D2433DC
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 08:20:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-_eU-vsHANuSQp3R5mk9QyA-1; Thu, 13 Aug 2020 02:20:00 -0400
X-MC-Unique: _eU-vsHANuSQp3R5mk9QyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F382280183C;
	Thu, 13 Aug 2020 06:19:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ABD45D9E8;
	Thu, 13 Aug 2020 06:19:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 610259A025;
	Thu, 13 Aug 2020 06:19:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07D6Hnpe002042 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 02:17:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE217201828D; Thu, 13 Aug 2020 06:17:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC5FA2026D69
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 06:17:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C227185A78B
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 06:17:45 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-247-IlgYjdEyPwOaugPPZcMAXA-1; Thu, 13 Aug 2020 02:17:42 -0400
X-MC-Unique: IlgYjdEyPwOaugPPZcMAXA-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 79FE169C6613CB7D804C;
	Thu, 13 Aug 2020 14:17:39 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 13 Aug 2020
	14:17:30 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <dm-devel@redhat.com>
References: <c6ff6ae5-8b58-4beb-b6c9-10db444ffce2@huawei.com>
	<109bd950021918cce1c89d0e92d137ffa6336ea2.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <33b9df21-ea6d-0ee9-9c41-f5461613fa66@huawei.com>
Date: Thu, 13 Aug 2020 14:17:30 +0800
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
  Thanks for your advices. I will modify it.

On 2020/8/11 17:32, Martin Wilck wrote:
> Hi Liaxiaokeng,
> 
> thanks again. I still have minor issues, see below.
> 
> On Tue, 2020-08-11 at 15:23 +0800, lixiaokeng wrote:
> 
>> In set_ble_device func, if blist is NULL or ble is NULL,
>> the vendor and product isn't freed. We think it is not
>> reasonable that strdup(XXX) is used as set_ble_device
>> and store_ble functions' parameter.
>>
>> Here we call strdup() in store_ble and set_ble_device
>> functions and the string will be free if functions fail.
>> Because constant string like "sdb" will be their parameter,
>> char * is changed to const char *. This is base on
>> upstream-queue branch in openSUSE/multipath-tools.
>>
>> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>> ---
>>  libmultipath/blacklist.c | 81 ++++++++++++++++++++++--------------
>> ----
>>  libmultipath/blacklist.h |  4 +-
>>  tests/blacklist.c        | 31 +++++++--------
>>  3 files changed, 59 insertions(+), 57 deletions(-)
>>
>> ...
>>
>> @@ -93,31 +100,40 @@ int set_ble_device(vector blist, char * vendor,
>> char * product, int origin)
>>  		return 1;
>>
>>  	if (vendor) {
>> -		regex_str = check_invert(vendor, &ble->vendor_invert);
>> -		if (regcomp(&ble->vendor_reg, regex_str,
>> -			    REG_EXTENDED|REG_NOSUB)) {
>> -			FREE(vendor);
>> -			if (product)
>> -				FREE(product);
>> -			return 1;
>> -		}
>> -		ble->vendor = vendor;
>> +		vendor_str = STRDUP(vendor);
>> +		if (!vendor_str)
>> +			goto out;
>> +
>> +		regex_str = check_invert(vendor_str, &ble-
>>> vendor_invert);
>> +		if (regcomp(&ble->vendor_reg, regex_str,
>> REG_EXTENDED|REG_NOSUB))
>> +			goto out;
>> +
>> +		ble->vendor = vendor_str;
>>  	}
>>  	if (product) {
>> -		regex_str = check_invert(product, &ble-
>>> product_invert);
>> -		if (regcomp(&ble->product_reg, regex_str,
>> -			    REG_EXTENDED|REG_NOSUB)) {
>> -			FREE(product);
>> -			if (vendor) {
>> -				ble->vendor = NULL;
>> -				FREE(vendor);
>> -			}
>> -			return 1;
>> -		}
>> -		ble->product = product;
>> +		product_str = STRDUP(product);
>> +		if (!product_str)
>> +			goto out1;
>> +
>> +		regex_str = check_invert(product_str, &ble-
>>> product_invert);
>> +		if (regcomp(&ble->product_reg, regex_str,
>> REG_EXTENDED|REG_NOSUB))
>> +			goto out1;
>> +
>> +		ble->product = product_str;
>>  	}
>>  	ble->origin = origin;
>>  	return 0;
>> +out1:
>> +	if (vendor_str)
>> +		ble->vendor = NULL;
>> +out:
>> +       free(vendor_str);
>> +       vendor_str = NULL;
>> +
>> +       free(product_str);
>> +       product_str = NULL;
>> +
>> +       return 1;
>>  }
> 
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

