Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A016A04C2
	for <lists+dm-devel@lfdr.de>; Wed, 28 Aug 2019 16:24:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 287AC18C4271;
	Wed, 28 Aug 2019 14:24:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB1C100197A;
	Wed, 28 Aug 2019 14:24:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E4BE4A486;
	Wed, 28 Aug 2019 14:24:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7SEO228005292 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 28 Aug 2019 10:24:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7678760610; Wed, 28 Aug 2019 14:24:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FF886060D
	for <dm-devel@redhat.com>; Wed, 28 Aug 2019 14:23:59 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7638687630
	for <dm-devel@redhat.com>; Wed, 28 Aug 2019 14:23:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l2so277474wmg.0
	for <dm-devel@redhat.com>; Wed, 28 Aug 2019 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nwD/uOYP9//DRbAGcipsQ9Y2svLK9ILS7LkR0TGRAeA=;
	b=Ba05jSCLp3cN+3Bq1OM9a99X8JnUcqMEzw79eeHomijEtUekP+VRSki5iwVl7krpn3
	SJ/gU4JhnokEY/GM8F8vRp1lUBb8ky+mbdCygui6hJFtjlhyGOLuTwEizgJ0e11cXDvc
	Y/plZak8NIsIiCwIbYM69NSJj4QEQpHcRY5yA59sbwW84SnbruEI8pwBnX38FVhhBly/
	HQLcitp7+g2K61r/TK2f5Th1NCwH0M4+Lf+DK/UuP5PV22zHZVBLYs9nlIkYqNcUSJd3
	OfYGvlW6QdSN1BJ0SQITA2Q68u0AuJMzJRTLBwp2R/jP9b8IZezuoz4OAnj+yGlyOqVk
	7L4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nwD/uOYP9//DRbAGcipsQ9Y2svLK9ILS7LkR0TGRAeA=;
	b=bqYNjkEQXA0xPJ6Bwv1tvUJijCL+PxImPYOmcjdKk4tTYBpBGN94ZJplllcO4BE7fH
	9tFv34HPacLgYvpqqsIr1p+L5CkxMy46MA8YSpQ/bsMLg3ORDmAiveWJMHBx2NwjjjIv
	B6PRo1Dylcy8h90KZbrulQuCPdxvrCJbyM3J/Z6lLksUpJpzbqOaiNdJvqOqtE6Ksy+T
	Ld9vOgZUJnlgz/vCFh0rxx+R4RD6v1fGZX9gHAUPY8AiDMJqQteqdKKJ2uhiBGco/SSX
	C7enW7+ea5PTix5RqochQdkNVuqLN5Bp72lUg+X+TJB2lrmdq/cpl2RsxZsdvv341p6w
	qagw==
X-Gm-Message-State: APjAAAUYn8+VLenHJ9OWnggxWGvcHi1aDisqmjyZF93liq5taOEP6NMi
	FO2x9RGyZVF99vaEGFAEGalfAw==
X-Google-Smtp-Source: APXvYqyYsPAbXg4M/qfo/ZDOPS7YSeH3uAZX88NRjP3MUh2rSMeGVh1ylzwQE7YnfpYzTjSf1l+3iw==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr5363356wmh.43.1567002236993;
	Wed, 28 Aug 2019 07:23:56 -0700 (PDT)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id o3sm1093987wrv.90.2019.08.28.07.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Aug 2019 07:23:56 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20190709141522.29606-1-ntsironis@arrikto.com>
	<20190709141522.29606-2-ntsironis@arrikto.com>
	<a6d47841-fcbc-50b2-724c-082be9e764d1@redhat.com>
	<e2b23d5c-0ef2-400b-9697-3fb7899ce3e2@arrikto.com>
	<92afa0f6-90ac-7a3f-8d8a-78fa446fec73@redhat.com>
	<d06576ba-2bcf-5e6f-7f4b-5dec61c807b5@arrikto.com>
	<859d881b-2c33-f49d-2fac-fcd8a22810f5@redhat.com>
	<5c127a57-127b-ff2e-c3f6-5cef626b1367@arrikto.com>
	<0a780ffc-c34c-2da4-80d1-8598d116c93f@arrikto.com>
	<20190827153447.GA3920@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <b913670c-8aea-2acf-e022-e13b0630a36d@arrikto.com>
Date: Wed, 28 Aug 2019 17:23:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827153447.GA3920@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 28 Aug 2019 14:23:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Wed, 28 Aug 2019 14:23:58 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, agk@redhat.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH 1/1] dm: add clone target
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Wed, 28 Aug 2019 14:24:31 +0000 (UTC)

On 8/27/19 6:34 PM, Mike Snitzer wrote:
> On Tue, Aug 27 2019 at 10:09am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> Hello,
>>
>> This is a kind reminder for this patch set. I'm bumping this thread to
>> solicit your feedback.
>>
>> Following the discussion with Heinz, I have provided extensive
>> benchmarks that show dm-clone's significant performance increase
>> compared to a dm-snapshot/dm-raid1 stack.
>>
>> How can we move forward with the review of dm-clone, so it can
>> eventually be merged upstream?
>>
>> Looking forward to your feedback,
> 
> I actually pulled it into my local dm-5.4 branch yesterday and have
> started reviewing.  Firrst pass it looks like you've got solid code; a
> lot of familiar code patterns too (barrowed from thinp, etc).
> 
> But the first thing that is tripping me up is the name "dm-clone"
> considering how cloning is so fundamental to all DM.  The second term
> that is just awkward is "hydration".  But that is just my initial
> thought.  I'll need the rest of the week to really dig in and have more
> constructive feedback for you.
> 

Hi Mike,

Thank you for your prompt response and also thank you in advance for all
the effort you will put in reviewing dm-clone.

Looking forward to your feedback,

Nikos

> Thanks for the ping; wasn't needed in this instance but it never hurts.
> 
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
