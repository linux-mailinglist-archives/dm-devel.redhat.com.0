Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD2E7F619
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:40:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6643C027339;
	Fri,  2 Aug 2019 11:40:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2C4F19C6A;
	Fri,  2 Aug 2019 11:40:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C16D41F53;
	Fri,  2 Aug 2019 11:40:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x71KT0U4022459 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 1 Aug 2019 16:29:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10B91100033A; Thu,  1 Aug 2019 20:29:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5EA1000336
	for <dm-devel@redhat.com>; Thu,  1 Aug 2019 20:28:55 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1116230CE8E2
	for <dm-devel@redhat.com>; Thu,  1 Aug 2019 20:28:54 +0000 (UTC)
Received: from mail-pl1-f197.google.com ([209.85.214.197])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1htHgy-0005xX-Cw
	for dm-devel@redhat.com; Thu, 01 Aug 2019 20:28:52 +0000
Received: by mail-pl1-f197.google.com with SMTP id y22so40262191plr.20
	for <dm-devel@redhat.com>; Thu, 01 Aug 2019 13:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QCJ4vg6Bq4PcT5glXzSZy5Mkbbyr2Ef4lNDEIG8R548=;
	b=IzRdW+plPVq7hntD78r2HPy/u+Giu5a7RzIVRS/upuTWbFGowCrRxPL1UpcNjf4Ueh
	KbETZYxM6MS65/zILW47zu5O0cM1l5Icjeu64ZL0JQEjxylBiRWUDIqd+zQ1g9D9r21Z
	UtsAtyYTxom2NHQsGWPRa/AcHgOErRiM5fX9e9dWUSdyFnhnKpy0DSPSpRA2Vrmr9K9k
	SQRJxtQ53CZPHerIayRwCYGDuOZ2kKZ6d5oQ/ziQtz7x52ErYpsGp/Ns8oHswggDcRM9
	57188pcAOQ/M+hjMGALgLdxlycudlQw397Ockmgo4XBgSLh7nihxoq1EdDqubQbRkpQF
	OEsg==
X-Gm-Message-State: APjAAAWZ1CCmdY1eyAU1on6Opg4qKEmOvYdDak1e6Yk0ks2QwnurIMc+
	59bfQIKj+JAn1hrS25loeLpQqGc7KvILgHYzPgV6UATTmTNUt4OGhEtAShXScK8tYMQw5Xabr9w
	dKvugE3SzeX8DKXMMZigdx1Oo4poZ0w==
X-Received: by 2002:a63:ee0c:: with SMTP id
	e12mr122830310pgi.184.1564691331089; 
	Thu, 01 Aug 2019 13:28:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1+AnMSrYjUU0Qm4tA1sS6bn3wBA6lqGpHC1DrfTXAN56OY92iiKg27Q4q1jM6d9J5vCJtDQ==
X-Received: by 2002:a63:ee0c:: with SMTP id
	e12mr122830290pgi.184.1564691330808; 
	Thu, 01 Aug 2019 13:28:50 -0700 (PDT)
Received: from [192.168.1.201] (201-43-220-172.dsl.telesp.net.br.
	[201.43.220.172]) by smtp.gmail.com with ESMTPSA id
	o14sm4976723pjp.19.2019.08.01.13.28.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Aug 2019 13:28:43 -0700 (PDT)
To: Song Liu <liu.song.a23@gmail.com>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<87zhkwl6ya.fsf@notabene.neil.brown.name>
	<6400083b-3cf3-cbc6-650a-c3ae6629b14c@canonical.com>
	<CAPhsuW69YrpHqBCOob2b5wzzWS9FM087sfe3iC0odX8kZWRwmA@mail.gmail.com>
	<CAPhsuW5zB=Kik4rq9YA-xBer7Z-h-23QV4WSCWe-jvhFgGc0Cw@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gpiccoli@canonical.com; prefer-encrypt=mutual; keydata=
	mQENBFpVBxcBCADPNKmu2iNKLepiv8+Ssx7+fVR8lrL7cvakMNFPXsXk+f0Bgq9NazNKWJIn
	Qxpa1iEWTZcLS8ikjatHMECJJqWlt2YcjU5MGbH1mZh+bT3RxrJRhxONz5e5YILyNp7jX+Vh
	30rhj3J0vdrlIhPS8/bAt5tvTb3ceWEic9mWZMsosPavsKVcLIO6iZFlzXVu2WJ9cov8eQM/
	irIgzvmFEcRyiQ4K+XUhuA0ccGwgvoJv4/GWVPJFHfMX9+dat0Ev8HQEbN/mko/bUS4Wprdv
	7HR5tP9efSLucnsVzay0O6niZ61e5c97oUa9bdqHyApkCnGgKCpg7OZqLMM9Y3EcdMIJABEB
	AAG0LUd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5vbmljYWwuY29tPokBNwQT
	AQgAIQUCWmClvQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDOR5EF9K/7Gza3B/9d
	5yczvEwvlh6ksYq+juyuElLvNwMFuyMPsvMfP38UslU8S3lf+ETukN1S8XVdeq9yscwtsRW/
	4YoUwHinJGRovqy8gFlm3SAtjfdqysgJqUJwBmOtcsHkmvFXJmPPGVoH9rMCUr9s6VDPox8f
	q2W5M7XE9YpsfchS/0fMn+DenhQpV3W6pbLtuDvH/81GKrhxO8whSEkByZbbc+mqRhUSTdN3
	iMpRL0sULKPVYbVMbQEAnfJJ1LDkPqlTikAgt3peP7AaSpGs1e3pFzSEEW1VD2jIUmmDku0D
	LmTHRl4t9KpbU/H2/OPZkrm7809QovJGRAxjLLPcYOAP7DUeltveuQENBFpVBxcBCADbxD6J
	aNw/KgiSsbx5Sv8nNqO1ObTjhDR1wJw+02Bar9DGuFvx5/qs3ArSZkl8qX0X9Vhptk8rYnkn
	pfcrtPBYLoux8zmrGPA5vRgK2ItvSc0WN31YR/6nqnMfeC4CumFa/yLl26uzHJa5RYYQ47jg
	kZPehpc7IqEQ5IKy6cCKjgAkuvM1rDP1kWQ9noVhTUFr2SYVTT/WBHqUWorjhu57/OREo+Tl
	nxI1KrnmW0DbF52tYoHLt85dK10HQrV35OEFXuz0QPSNrYJT0CZHpUprkUxrupDgkM+2F5LI
	bIcaIQ4uDMWRyHpDbczQtmTke0x41AeIND3GUc+PQ4hWGp9XABEBAAGJAR8EGAEIAAkFAlpV
	BxcCGwwACgkQzkeRBfSv+xv1wwgAj39/45O3eHN5pK0XMyiRF4ihH9p1+8JVfBoSQw7AJ6oU
	1Hoa+sZnlag/l2GTjC8dfEGNoZd3aRxqfkTrpu2TcfT6jIAsxGjnu+fUCoRNZzmjvRziw3T8
	egSPz+GbNXrTXB8g/nc9mqHPPprOiVHDSK8aGoBqkQAPZDjUtRwVx112wtaQwArT2+bDbb/Y
	Yh6gTrYoRYHo6FuQl5YsHop/fmTahpTx11IMjuh6IJQ+lvdpdfYJ6hmAZ9kiVszDF6pGFVkY
	kHWtnE2Aa5qkxnA2HoFpqFifNWn5TyvJFpyqwVhVI8XYtXyVHub/WbXLWQwSJA4OHmqU8gDl
	X18zwLgdiQ==
Message-ID: <9674ca8f-4325-3023-8a1d-39782103f55d@canonical.com>
Date: Thu, 1 Aug 2019 17:28:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPhsuW5zB=Kik4rq9YA-xBer7Z-h-23QV4WSCWe-jvhFgGc0Cw@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Thu, 01 Aug 2019 20:28:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 01 Aug 2019 20:28:54 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
Cc: Neil F Brown <nfbrown@suse.com>, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
 block device is gone
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 02 Aug 2019 11:40:42 +0000 (UTC)



On 31/07/2019 16:56, Song Liu wrote:
> On Wed, Jul 31, 2019 at 12:54 PM Song Liu <liu.song.a23@gmail.com> wrote:
>>
>> On Tue, Jul 30, 2019 at 5:31 AM Guilherme G. Piccoli
>> <gpiccoli@canonical.com> wrote:
>>>
>>> On 29/07/2019 21:08, NeilBrown wrote:
>>>> [...]
>>>>> +    if (unlikely(test_bit(MD_BROKEN, &mddev->flags))) {
>>>>> +            bio_io_error(bio);
>>>>> +            return BLK_QC_T_NONE;
>>>>> +    }
>>>>
>>>> I think this should only fail WRITE requests, not READ requests.
>>>>
>>>> Otherwise the patch is probably reasonable.
>>>>
>>>> NeilBrown
>>>
>>> Thanks for the feedback Neil! I thought about it; it seemed to me better
>>> to deny/fail the reads instead of returning "wrong" reads, since a file
>>> read in a raid0 will be incomplete if one member is missing.
>>> But it's fine for me to change that in the next iteration of this patch.
>>
>> For reads at block/page level, we will either get EIO or valid data, right?
>>
>> If that's not the case, we should fail all writes.
> 
> Oops, I meant all _reads_.

Hi Song, thanks for the feedback! After changing the patch and testing a
bit, it behaves exactly as you said, we got either valid data read from
the healthy devices or -EIO for the data tentatively read from the
failed/missing array members.

So, I'll resubmit with that change. Also, I've noticed clearing the
BROKEN flag seem unnecessary, if user stops the array in order to fix
the missing member, it'll require a re-assembly and the array is gonna
work again.

Do you / Neil considers this fix relevant to md/linear too? If so, I can
also include that in the V2.
Thanks,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
