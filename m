Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E77B2E0DCF
	for <lists+dm-devel@lfdr.de>; Tue, 22 Oct 2019 23:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571780008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=Z9eKxEWwxYmVX8C6tbFQ5RyXpw1qMc4ADCgKgpM9kbM=;
	b=CXhR2/Qp9fD1CYcrBSrq4MB1yoZSdpw6mDRxBh1nqnHKM5fgmU0p7tbViHAavRd0i41v9q
	RA7orCMpQDvDEzuI5AgXnQ3BBS1q8obQVvfJ83sbJtcRjm843c/8HkNYYFevZuFXxP88oA
	z5ighpgTNaZ4JUV2lFwjffGzc/TLHDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-oKl0TcrbNqqx0lNt_NcuPQ-1; Tue, 22 Oct 2019 17:33:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8220A1005509;
	Tue, 22 Oct 2019 21:33:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7F5110027A1;
	Tue, 22 Oct 2019 21:33:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8320E4A486;
	Tue, 22 Oct 2019 21:33:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MLX4vQ025130 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 17:33:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92B5260624; Tue, 22 Oct 2019 21:33:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246FD614C4;
	Tue, 22 Oct 2019 21:32:59 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8009710C0925;
	Tue, 22 Oct 2019 21:32:58 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q15so8951918pll.11;
	Tue, 22 Oct 2019 14:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=11+q5wn9mwwOL/OFJ3WGFp4s5Otq+BkeU+jDJ4wjv0M=;
	b=dbEDcT4ABB7GK2ZGdjKhMyS0pObfJ88v1Vy70txf+QzGtpBjwVu2pZ8CD+8NUfsidl
	yUi0EuwTLcLI+eNtDbjDum9X5AYEQzLAF/PhC0a2/EOy1/lEHmq1n0/CSgjWdSPDLu0D
	znboXkEkz2/5AiMGsruuPyrrff6BLARaNTNh88vWG5C/LYVfeRFfZnFK8Hh0sty5vJFM
	Wjd0+ekGg5IxpQ5H65BGP1Cpi+X1ec0dpP+cnz1yNJV54NjEA/lOZJvKlOC1yUBdRV71
	avFQEVisqIKYX+yvh+AsNB1u2uurKZTdLL+aFZz4izKCoKDhMv/jlYudrQeQ5QumZc7W
	PMGw==
X-Gm-Message-State: APjAAAUBm95TwbiAANlLtVSLvTOTmPPoZgIAbpAvYGXrvAjNA75oQS1H
	GU8BVWtmoQj4PSZ3O1Ba8JOPZehD
X-Google-Smtp-Source: APXvYqzvaKzzV35d8g4+jTlkRM/R+xEyUuJVh00hkQibaCjo7m2PHnZukc8t5vaoH6ZNiJSt8zeoAQ==
X-Received: by 2002:a17:902:b58e:: with SMTP id
	a14mr6046680pls.0.1571779977253; 
	Tue, 22 Oct 2019 14:32:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:647:4000:c3:ccbd:2d81:281:ddbd])
	by smtp.gmail.com with ESMTPSA id 16sm3055216pgd.0.2019.10.22.14.32.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 22 Oct 2019 14:32:56 -0700 (PDT)
To: Martin Wilck <Martin.Wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-46-martin.wilck@suse.com>
	<34e6fc87-10f6-efd7-c8df-710e56cc1956@acm.org>
	<f895f01df7c429abf4a32a395764513c92ecc3af.camel@suse.com>
	<42e85b61-3f38-af4e-a485-1ba230506d0f@acm.org>
	<690ab1be1dc189c6efebf5fb953f31f9f0341286.camel@suse.com>
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
Message-ID: <b4e750e1-ecc1-853d-5582-fae16b3932f0@acm.org>
Date: Tue, 22 Oct 2019 14:32:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <690ab1be1dc189c6efebf5fb953f31f9f0341286.camel@suse.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Tue, 22 Oct 2019 21:32:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Tue, 22 Oct 2019 21:32:58 +0000 (UTC) for IP:'209.85.214.196'
	DOMAIN:'mail-pl1-f196.google.com'
	HELO:'mail-pl1-f196.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.478  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.196 mail-pl1-f196.google.com 209.85.214.196
	mail-pl1-f196.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: oKl0TcrbNqqx0lNt_NcuPQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On 2019-10-22 13:34, Martin Wilck wrote:
> Most uses of snprintf() are in libmultipath printing code, where items
> are printed sequentially into a big buffer, advancing the buffer
> pointer on the way. asprintf() doesn't match that use case well,
> AFAICS. But in some other places, switching to asprintf would certainly
> make sense. Anyway, I'd like to do that in a separate patch set if you
> don't mind; this one is big enough already.

Hi Martin,

For this patch, have you considered to change the type of the 'bufsiz'
argument of format_partname() from size_t into int or unsigned int? I do
not expect that the output string will ever exceed 65535 characters. As
you probably know the C standard guarantees that there are at least 16
bits in an int.

I'd like to reiterate that introducing -Wsign-compare seems dubious to me.

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

