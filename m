Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D1948C4
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 17:46:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7931190C10C;
	Mon, 19 Aug 2019 15:46:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EEDE5C1D6;
	Mon, 19 Aug 2019 15:46:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C7B924F30;
	Mon, 19 Aug 2019 15:46:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JFjoQe016541 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 11:45:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20A312618A; Mon, 19 Aug 2019 15:45:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB5E1C95A;
	Mon, 19 Aug 2019 15:45:46 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2E43307D965;
	Mon, 19 Aug 2019 15:45:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e8so315025wme.1;
	Mon, 19 Aug 2019 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=SorNwHjMyL1J/IbhLWJYch/yDq736+DujF1L1H8tkP4=;
	b=i4r5ZGPFMu0oF+oHlsjdoAJRgOuyyIZfY2hEOpCqtZpqrBkGdLiw2au3LWJFzwxitp
	f3QueA6HeTV+Bbpj5ydAXaV8LRI0Ez0Sh1b0/a2JBihoJvS/tL+qySwrZa3xH8KkR1NX
	bJyFWQSusXsMlOGm0U6Vmxk2jQHzHxlRB9/eQj7GC8Nwup/CT1BO9rxZhdA6J9+e8cqf
	o6mZmbOeu4DVyVM2ByIELdAAaAzhcguX0ylh/qTB8ScEbyWzDuxBlibfe7U6GXXD8AyR
	V5NmgJSwl5yzFlhPRHBcpVDRgoyiBv8xk5qnpe8P2/GhbMwkP5NT5Qi1JJxD/Cxnx/Kk
	fXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SorNwHjMyL1J/IbhLWJYch/yDq736+DujF1L1H8tkP4=;
	b=N5vb33aA1RH6n6t2Oj8jXvepLas0m9qZeKUkBGaeLoks7fxZc9HJjj3Fg5OjOhtaRJ
	xDPFioF5NdlhRl3u7XSd8anMrQapTJxkGDBIYDvZSUUrN4gIDO60Cr67jFxoSedruMu0
	90tjLwphuKiHxNXGfukuqoG2euB18s5PTHqMwCWTEA5lkY/xSRqMiCVpnX3CNipi0Br7
	RRR53l6Q0xnkWqqHe+4y90YRqqHVNXT/OhUoW09Xo3hndUzN+tEENfIffV2fzym81Z64
	hWN+EXrI3EiBjvZvl0QVq2XHZAGQp7dw5I0xWRCu/ZmsiSB9jWIvSuk+N/9Kxp62gtDX
	iCyA==
X-Gm-Message-State: APjAAAV6jN106GZwBllDyE6IT27/EeHHw0RGqYKUCHi+DboxsP4yM8Qo
	I4XuYA2wlG3F3L3Vj4ZzrTdGgd0=
X-Google-Smtp-Source: APXvYqz/QUutXiyWnABCOmHbXah4+1Thc/TtMGmW4rEOnx94zWXKwqdl07JjAEkHHQNNWxUYnd9dgg==
X-Received: by 2002:a1c:7606:: with SMTP id r6mr20671779wmc.118.1566229544374; 
	Mon, 19 Aug 2019 08:45:44 -0700 (PDT)
Received: from localhost (239.red-79-148-34.dynamicip.rima-tde.net.
	[79.148.34.239]) by smtp.gmail.com with ESMTPSA id
	v3sm15842742wrq.34.2019.08.19.08.45.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 19 Aug 2019 08:45:43 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Brian King <brking@linux.vnet.ibm.com>, DM-DEVEL ML <dm-devel@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
References: <20190801172138.15049-1-xose.vazquez@gmail.com>
	<20190814154111.GE25414@octiron.msp.redhat.com>
Message-ID: <894a30db-0af2-6598-e37e-26617ff2b3ea@gmail.com>
Date: Mon, 19 Aug 2019 17:45:42 +0200
MIME-Version: 1.0
In-Reply-To: <20190814154111.GE25414@octiron.msp.redhat.com>
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 19 Aug 2019 15:45:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 19 Aug 2019 15:45:46 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipath-tools: reorder NVDISK devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Mon, 19 Aug 2019 15:46:15 +0000 (UTC)

On 8/14/19 5:41 PM, Benjamin Marzinski wrote:

> On Thu, Aug 01, 2019 at 07:21:38PM +0200, Xose Vazquez Perez wrote:
>> Otherwise "3303[ ]+NVDISK" is never reached, because "NVDISK" regex takes
>> priority over it.
> 
> Huh? I don't understand why this is necessary. First off, with Martin's
> hwentry code, all matching hardware entries are used, not just the
> latest. But second, and more importantly, the AIX NVDISK entry won't
> ever match the same disks as the IBM 3303[ ]+NVDISK, since they have
> different vendors.  Right?

Yes, you are right. I mixed badly IBM-AIX in my head.

I'm sorry for the noise.

Christophe, remove this patch from your queue.


Thanks.

>> Cc: Brian King <brking@linux.vnet.ibm.com>
>> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
>> Cc: DM-DEVEL ML <dm-devel@redhat.com>
>> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
>> ---
>>  libmultipath/hwtable.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
>> index a06872e..8209554 100644
>> --- a/libmultipath/hwtable.c
>> +++ b/libmultipath/hwtable.c
>> @@ -696,12 +696,6 @@ static struct hwentry default_hw[] = {
>>  		.pgpolicy      = MULTIBUS,
>>  		.no_path_retry = (300 / DEFAULT_CHECKINT),
>>  	},
>> -	{
>> -		/* 3303 NVDISK */
>> -		.vendor        = "IBM",
>> -		.product       = "3303[ ]+NVDISK",
>> -		.no_path_retry = (300 / DEFAULT_CHECKINT),
>> -	},
>>  	{
>>  		/* AIX NVDISK */
>>  		.vendor        = "AIX",
>> @@ -712,6 +706,12 @@ static struct hwentry default_hw[] = {
>>  		.no_path_retry = (300 / DEFAULT_CHECKINT),
>>  		.prio_name     = PRIO_ALUA,
>>  	},
>> +	{
>> +		/* 3303 NVDISK */
>> +		.vendor        = "IBM",
>> +		.product       = "3303[ ]+NVDISK",
>> +		.no_path_retry = (300 / DEFAULT_CHECKINT),
>> +	},
>>          /*
>>           * Lenovo
>>           */
>> -- 
>> 2.21.0
>>
>> --
>> dm-devel mailing list
>> dm-devel@redhat.com
>> https://www.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
