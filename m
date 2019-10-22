Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEEDE0995
	for <lists+dm-devel@lfdr.de>; Tue, 22 Oct 2019 18:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571762871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=YhOF0e7LoKz4oOAiI6fB7+9izeiDtGW+MBWZNxJXMtA=;
	b=I3/fXrdF+gvzYFHboifwzRo6qvLSO6K7+ajTQLwdYUxDuFds66FzJW1lsoUDqGV3wCX2Wv
	v861hzvYiRN3TFPXqmE6xKnuSG5RrSQnOgdj9X+/KlJtFOWdxLAz5kF2DSLrttToxMJ/5k
	l6UhGL3oiDQ72nevMpHjCEXwsLRonCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-ROEdkjutOkeodgu2cZCDew-1; Tue, 22 Oct 2019 12:47:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44FCC107AD31;
	Tue, 22 Oct 2019 16:47:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0095B3DE2;
	Tue, 22 Oct 2019 16:47:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C744180085A;
	Tue, 22 Oct 2019 16:47:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MGlLol013650 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 12:47:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 344A25D717; Tue, 22 Oct 2019 16:47:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF7375D6A9;
	Tue, 22 Oct 2019 16:47:18 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCB3618C4266;
	Tue, 22 Oct 2019 16:47:16 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b128so11017220pfa.1;
	Tue, 22 Oct 2019 09:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jDd7Xeq0QYBchA9TO63GH0jQClNhSGpNKn+JFs7s6R4=;
	b=RY2g5UiO8LL7pV0+OyenZvXZBKbREXJssKstRDsup0ZxRQDKfL5KptCq2lqFfVH/J2
	KXfSZgXxGKqwqVaNyZj7OCzQAN73NK90NQEYOrHRlX51iCKApM0wlouMFZMOAu54PVcA
	1etlJ3dTc3AFdCn4fskd504OwIoF0HKe3NfLGgcnreFlkxzeM//Tck3ASiVn2VyTP9Ck
	7npZzoAdGNU8B8A6/hpgLMN91IJTpI7re5hPvXDdwEuj2GFcOKeQ/j4bangiwnbQZKLt
	17HXMDbf/BsxCDLbgPluh20uH/0l2zaoxtiCVri+ExC8OEqIfIVmqmxslhVLEuC0TuEh
	EJDg==
X-Gm-Message-State: APjAAAUknArkl4X6JFJROzP0XkBJBGmYjOzaQopHfFs8INQpFNxYqPM2
	jmZ/k38nU9KBQdUmhAwTUw1zrO4e
X-Google-Smtp-Source: APXvYqzoPnBsHtpnR+mnFNzamr1XLKTsmRHsL7Ur2sKl6AB2O597GIUkVmCKr2vasLBqfCjegpe4pg==
X-Received: by 2002:a17:90a:aa0a:: with SMTP id
	k10mr5750395pjq.13.1571762835559; 
	Tue, 22 Oct 2019 09:47:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:647:4000:c3:ccbd:2d81:281:ddbd])
	by smtp.gmail.com with ESMTPSA id
	a13sm24098456pfg.10.2019.10.22.09.47.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 22 Oct 2019 09:47:13 -0700 (PDT)
To: Martin Wilck <Martin.Wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-46-martin.wilck@suse.com>
	<34e6fc87-10f6-efd7-c8df-710e56cc1956@acm.org>
	<f895f01df7c429abf4a32a395764513c92ecc3af.camel@suse.com>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
	mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
	LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
	fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
	AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
	3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
	AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
	igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
	Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
	jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
	macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
	CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
	RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
	PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
	eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
	lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
	T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
	++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
	CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
	oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
	//x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
	mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
	goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <42e85b61-3f38-af4e-a485-1ba230506d0f@acm.org>
Date: Tue, 22 Oct 2019 09:47:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f895f01df7c429abf4a32a395764513c92ecc3af.camel@suse.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Tue, 22 Oct 2019 16:47:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Tue, 22 Oct 2019 16:47:16 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.478  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 45/72] libmultipath: fix -Wsign-compare
 warnings with snprintf()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ROEdkjutOkeodgu2cZCDew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On 2019-10-22 09:07, Martin Wilck wrote:
> Hello Bart,
>=20
> On Sat, 2019-10-12 at 15:59 -0700, Bart Van Assche wrote:
>> On 2019-10-12 14:28, Martin Wilck wrote:
>>> -=09if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part) >=3D
>>> bufsiz)
>>> +=09if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part)
>>> +=09    >=3D (int)bufsiz)
>>>  =09=09return 0;
>>
>> Please don't insert casts like this. I think enabling -Wsign-compare
>> is
>> wrong because it makes the source code ugly.
>=20
> The casts make it explicit which signedness is intended, which is a
> good thing IMO, better than the compiler trying to figure it out
> using implicit type conversion. Enabling the warning will help avoid
> subtle programming errors in the future, by forcing us to think twice
> about signedness. Considering that, isn't this ugliness - which I don't
> dispute - a relatively minor issue?
>=20
> In this particular case, we're dealing with a historically-caused
> property of snprintf(), as you are probably aware=20
> (https://stackoverflow.com/questions/45740276/why-does-printf-return-an-i=
nt-instead-of-a-size-t-in-c),
> so I'd argue the ugliness is forced upon us, sort of.
>=20
> We can hide the ugliness in a macro if you prefer. Actually, we have
> safe_snprintf() already. We just need to use it in all places where
> this kind of comparison is made. Would that be acceptable to you?

Hi Martin,

Have you considered to use asprintf() instead of snprintf() and a check
whether the output buffer overflows? I think the former is a more
elegant solution.

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

