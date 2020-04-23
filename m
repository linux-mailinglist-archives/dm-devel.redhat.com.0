Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D7D691B54E2
	for <lists+dm-devel@lfdr.de>; Thu, 23 Apr 2020 08:48:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587624528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SkqTHz9bvZtG3Mfdx1ixuUJO0UTlTIR5rUwWcGcCdhQ=;
	b=BDVs4N2Sq48Qk3sYXa2eSpCXE06S372UNoOS12Ji8F5YCZO6AEghpZTDkF+lQk4KBUCcGM
	7vdqn4gngMAJQ9LfVs5gJd+Xo39aLje/YjVqY6jSNkxiDW74DSTScSyzZFoZwSiNTy3JII
	8/j0JAFIhPIBCG3oWSQwTPR7T8XAFTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-XEOP94OkNlC-R041PYTOGg-1; Thu, 23 Apr 2020 02:48:45 -0400
X-MC-Unique: XEOP94OkNlC-R041PYTOGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E28800FF0;
	Thu, 23 Apr 2020 06:48:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A23F45D750;
	Thu, 23 Apr 2020 06:48:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3C111809542;
	Thu, 23 Apr 2020 06:48:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03N6ljkp006776 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 02:47:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68F21100727A; Thu, 23 Apr 2020 06:47:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F721013011
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 06:47:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F974811E7A
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 06:47:43 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-309-jluyBKRCPUa0_ihUka7Ppg-1; Thu, 23 Apr 2020 02:47:37 -0400
X-MC-Unique: jluyBKRCPUa0_ihUka7Ppg-1
Received: by mail-wr1-f65.google.com with SMTP id j1so5450623wrt.1;
	Wed, 22 Apr 2020 23:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sIXDR8kl7zuJ6TeBajI1HsS8I3soOXcdJ1DQx5br9q4=;
	b=hfvA/laVNLvACme9IPF8uFI+U4HY2t/ZxHKt9LYKFl2sZFEHN194lkJk5bSPVgeqys
	gJqJpH8n83CZHvnPquNhOf2+xag2/LSSg4EWxE+i7rEvv/vOOGB3To6w1n5bPKE3lhWB
	/yI6mdwFXpo6EH85ce1HGU/SQYJDuY2/h2JBuu6J8z4X2S3q4w5jLn9/gm4ADrFIagt5
	lSVE2CEVIva3baqjMW7kVbLWP5jyjbPFoqUqQ19JoiKq95qNh5gYvzn9nQ9NVvBAPQnv
	s2vn+BnEboYxRWP2J7WGrZqhmwKAs3l/SQj/Ra01hL9Voibcf2ZLkKDCIUPWWNuYJ66B
	ikAw==
X-Gm-Message-State: AGi0PuaZo0WBQeUBfRDK0sk/fvrQu8t/4Kka2oy/3sc1EjvGREHFUb9q
	TZAd2fVwLcLHOv5LKNaIPL9yyb30GBw=
X-Google-Smtp-Source: APiQypKhe+BJqPZGtYunMBUBqDWmFkNOVCuMKAYb/B2hK1oZa2Zl9vr+aFW4JtvTvcMDG+ntpKmxFQ==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr3365949wro.347.1587624454751; 
	Wed, 22 Apr 2020 23:47:34 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	a20sm2389282wra.26.2020.04.22.23.47.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Apr 2020 23:47:33 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
	<e3b78a32-4307-c60c-f9c3-dd6d71b6633c@gmail.com>
	<20200422214052.GA10695@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <67eedf43-7afb-3c2e-704a-d0ac187d6a4b@gmail.com>
Date: Thu, 23 Apr 2020 08:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422214052.GA10695@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry_baryshkov@mentor.com>,
	David Howells <dhowells@redhat.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt: support using encrypted keys
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22/04/2020 23:40, Mike Snitzer wrote:
> On Wed, Apr 22 2020 at 12:47pm -0400,
> Milan Broz <gmazyland@gmail.com> wrote:
> 
>> On 21/04/2020 20:27, Mike Snitzer wrote:
>>> On Mon, Apr 20 2020 at  9:46P -0400,
>>> Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>>>
>>>> From: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
>>>>
>>>> Allow one to use encrypted in addition to user and login key types for
>>>> device encryption.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
>>>
>>> I fixed up some issues, please see the following incremental patch,
>>> I'll get this folded in and staged for 5.8.
>>
>> And you just created hard dependence on encrypted key type...
>>
>> If you disable this type (CONFIG_ENCRYPTED_KEYS option), it cannot load the module anymore:
>> ERROR: modpost: "key_type_encrypted" [drivers/md/dm-crypt.ko] undefined!
> 
> Yes, I was made aware via linux-next last night.
> 
>> We had this idea before, and this implementation in dm-crypt just requires dynamic
>> key type loading implemented first.
>>
>> David Howells (cc) promised that moths ago, but apparently nothing was yet submitted
>> (and the proof-of-concept patch no longer works).
> 
> Why is it so bad for dm-crypt to depend on CONFIG_ENCRYPTED_KEYS while
> we wait for the innovation from David?

People need to compile kernel with specific features disabled, even without keyring sometimes.
We also support whole CONFIG_KEYS disable - and it makes sense for some small appliances.

In fact I had similar patch (support for encrypted+trusted keyes) for dm-crypt for months,
with additional patch that loads key types per requests (so it can fail if the type is not available).
It uses key_type_lookup function exported. IMO this is the way to go.

So the idea is good, but please keep possibility to disable it.
Additional dependencies not only cause problems above, but also can get some failures from initrd
where the new module is missing (that happened several times, it is just problem
that can be easily avoided).

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

