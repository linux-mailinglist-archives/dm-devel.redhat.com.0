Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 230BF10A174
	for <lists+dm-devel@lfdr.de>; Tue, 26 Nov 2019 16:48:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574783329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8jFXqGIxh3FvH9iiPQXpsRERSoSOsESAN2yrdRoIpgI=;
	b=MeGdPGIOa72WR7v75XRUXF2/YBREts+hUT08E9JngdRTXSQ4ZHsyEwfr0cdk5evVjeCuJa
	Xb3m6rKj/vcB4EvHrlonb6ylH5qvBcy+nnmK90c3yUxRNu9jPLwLlVyQoEpBZ8F6DZnW38
	fmj1d8IGKoJ9nOVrYMBwS/+mFSijrtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-erZfPrVGNI6H7litq4f5Qg-1; Tue, 26 Nov 2019 10:48:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E6BA3753;
	Tue, 26 Nov 2019 15:48:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F5F1001281;
	Tue, 26 Nov 2019 15:48:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF7DB4BB65;
	Tue, 26 Nov 2019 15:48:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQFmOY0014110 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 10:48:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 893AFD95EE; Tue, 26 Nov 2019 15:48:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 854B9F18D4
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 15:48:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EE0480207A
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 15:48:22 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-9-OKP-n-FRMvGuRgsr8K9l-Q-1; Tue, 26 Nov 2019 10:48:18 -0500
Received: by mail-lf1-f66.google.com with SMTP id y5so1793836lfy.7
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 07:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Cq9B/lKYC8Fqe64uYwAj+T3jZ8b3/FeQGgKmi0TFQ78=;
	b=U1MDD0MyH4l9cZqe9K1rSzBUXYVXHJyyPddMr2NPhjG94hHy9MepAcTLwgui1BTBJf
	dguC7Vk1ILfLgz145SaIZ4bTMHNS60B+5BLZT1hJKPG3dnWV8acRqA1iufYAt3pXV8s6
	NSdw5DwgXK4v4dtwzfwYFPC/iC8JiZiQD9DfJQ7lM78gn4yorJmvmSKCwmNeDNyxxkAA
	3St9hvNMszOsR0/YLTKuqCguapwqHzILTF+u8/N9PvyID2yg5FhOGJiRT983t23jNwDa
	lVduAavllty8Pegn8VZHT3SWex/T7WTMDkDklPMnDh9zwJwM1uabzM5FGPL8j4sLptD7
	DE9A==
X-Gm-Message-State: APjAAAXBWQAWORDFdZBbn2wGIiFy/Rk9qiWc0Pg5azloQ/gnAfFGA+1F
	ZOjW/iYA4t+XpKYO3SKQslKKDQ==
X-Google-Smtp-Source: APXvYqzo73coXkcxnOjPd8mjF9bD0kmfUmn8s5uZlOIL+nOeE9rWTYCYYCF0BlV0cBS1ArhO0p/bag==
X-Received: by 2002:a19:5013:: with SMTP id e19mr20642039lfb.8.1574783296270; 
	Tue, 26 Nov 2019 07:48:16 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	m16sm5656059ljb.47.2019.11.26.07.48.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 26 Nov 2019 07:48:15 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>
References: <2044145.ITN4Tc4rAJ@archlinux>
	<6635828b-2ca6-c4d4-fc70-46e9a0bd2ed5@arrikto.com>
	<20191126154048.GB2025@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <6c74fc5b-46f4-018b-005a-ded2ee570320@arrikto.com>
Date: Tue, 26 Nov 2019 17:48:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191126154048.GB2025@redhat.com>
Content-Language: en-US
X-MC-Unique: OKP-n-FRMvGuRgsr8K9l-Q-1
X-MC-Unique: erZfPrVGNI6H7litq4f5Qg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: diegocg@gmail.com, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm clone: Add to the documentation index
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 11/26/19 5:40 PM, Mike Snitzer wrote:
> On Tue, Nov 26 2019 at  7:00am -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> From: Diego Calleja <diegocg@gmail.com>
>>
>> It was missing from the initial commit
>>
>> Signed-off-by: Diego Calleja <diegocg@gmail.com>
>>
>> ---
>>   Documentation/admin-guide/device-mapper/index.rst | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/admin-guide/device-mapper/index.rst b/
>> Documentation/admin-guide/device-mapper/index.rst
>> index c77c58b8f67b..d8dec8911eb3 100644
>> --- a/Documentation/admin-guide/device-mapper/index.rst
>> +++ b/Documentation/admin-guide/device-mapper/index.rst
>> @@ -8,6 +8,7 @@ Device Mapper
>>       cache-policies
>>       cache
>>       delay
>> +    dm-clone
>>       dm-crypt
>>       dm-flakey
>>       dm-init
>> -- 
>> 2.24.0
> 
> I've picked this up:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.5&id=484e0d2b11e1fdd0d17702b282eb2ed56148385f
> 
> Nikos, please note that if you send a patch on someone else's behalf you
> should add you Signed-off-by.  I've updated the commit header
> accordingly.

You are right, I am sorry. I will keep that in mind the next time.

Thanks,
Nikos

> 
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

