Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAACE2796A2
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 06:24:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-N3YuR_5aPJWpI-R4jHGu9A-1; Sat, 26 Sep 2020 00:24:15 -0400
X-MC-Unique: N3YuR_5aPJWpI-R4jHGu9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21BD7107464A;
	Sat, 26 Sep 2020 04:24:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4B975D9DC;
	Sat, 26 Sep 2020 04:24:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3176544A4E;
	Sat, 26 Sep 2020 04:23:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08Q4NZ6a009086 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 00:23:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8168C2166BA0; Sat, 26 Sep 2020 04:23:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5492166B44
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 04:23:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D85F811E76
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 04:23:32 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-39mFiM1fOmuQJleRr3LDtA-1; Sat, 26 Sep 2020 00:23:28 -0400
X-MC-Unique: 39mFiM1fOmuQJleRr3LDtA-1
Received: by mail-pg1-f176.google.com with SMTP id 5so4154509pgf.5
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 21:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6alDKhYwWQmFweoszwFtA6wmUP3fWLcuSB5RMxfy4Vo=;
	b=MPWeOio2taU2iXtfDxCj3tRTC+doxEOOol68kG4nzl7KE2IoMsZWlcxN3jficwf3r9
	5n+Qbrm/asPCNobm/xubmRe5oi41COo01/HlDhuZLPq3QG1HHX3K5i7X8jhhNUtKFGce
	Q0fBdFgskPJXa+dnsgr8qoJyHQv3h1CYqPQ7wAVHYbZStxh1KDs3gFGd14bliuDw2PAf
	MceNESX6I5ZmZHxnmBcHk3HSczS8Xp4x9azcCl2JEUilWwL20j6o7fkp42S7mpoYtYjl
	2dlPVC/qPIXV+W6SvB/ltQhzpKbmRfk2wqTC4kNPTjeQ7XcgBD9DVE/twzWSAlLNVeRY
	jwnQ==
X-Gm-Message-State: AOAM530In94quRHOdXEbSuOxAuU7+oAhAHDm3D0/wMWObEneoENl7vsL
	ZLEsADbz4y3H1JJDFjtswzS2yoMWueI=
X-Google-Smtp-Source: ABdhPJzKk6HhxeFNeo3FZWkwyGATgr0M5BmGWooHe2zyOzvwQKuxnfdk+S/NDfodFIK3UMM9siqCDg==
X-Received: by 2002:a63:c5:: with SMTP id 188mr1594410pga.6.1601094207130;
	Fri, 25 Sep 2020 21:23:27 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:8ee4:7db:d6f2:5686?
	([2601:647:4000:d7:8ee4:7db:d6f2:5686])
	by smtp.gmail.com with ESMTPSA id x3sm525546pjf.42.2020.09.25.21.23.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 25 Sep 2020 21:23:26 -0700 (PDT)
To: Brian Bunker <brian@purestorage.com>,
	device-mapper development <dm-devel@redhat.com>
References: <04F146B1-3EB2-42C0-87EA-E0EABC3D8020@purestorage.com>
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
Message-ID: <11252f8f-9acd-599d-1882-8d1dd71698cd@acm.org>
Date: Fri, 25 Sep 2020 21:23:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <04F146B1-3EB2-42C0-87EA-E0EABC3D8020@purestorage.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] Make LUNs higher than 255 more friendly to look at
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
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMC0wOS0yNCAxNDoxMCwgQnJpYW4gQnVua2VyIHdyb3RlOgo+IEZvciBMVU5zIGJldHdl
ZW4gMCBhbmQgMjU1IHBlcmlwaGVyYWwgYWRkcmVzc2luZyBpcyB1c2VkLiBGb3IgTFVOcyBoaWdo
ZXIgdGhhbiAyNTUgdGhlIExVTiBhZGRyZXNzaW5nCj4gc2hvdWxkIHN3aXRjaCB0byBmbGF0IGFj
Y29yZGluZyB0byB0aGUgc3BlY2lmaWNhdGlvbi4gSW5zdGVhZCBvZiBwcmludGluZyBvdXQgdGhl
IExVTiBudW1iZXIgd2l0aG91dCByZWdhcmQgdG8KPiB0aGUgc2hpZnRpbmcgb2YgYWRkcmVzcyBt
ZXRob2QsIGRpc3BsYXkgdGhlIExVTiBhcyBpdCB3YXMgaW50ZW5kZWQgdG8gYmUgdGhlIHVzZXIg
Y29ubmVjdGluZyB0aGUgTFVOLiBUaGUKPiBjdXJyZW50IGRpc3BsYXkgbGVhdmVzIGEgbm9uLW9i
dmlvdXMgMTYzODQgb2Zmc2V0Lgo+IAo+IEluIHNob3J0LCBhIExVTiBjb25uZWN0ZWQgYXMgMjU4
IHdpbGwgc2hvdyB1cCBpbiBtdWx0aXBhdGggb3V0cHV0IGFzIDE2NjQyLiBJbnN0ZWFkIGRpc3Bs
YXkgaXQgYXMgdGhlCj4gZXhwZWN0ZWQgMjU4LiBUaGlzIGlzIGZvciBkaXNwbGF5IG9ubHkgYW5k
IGRvZXNu4oCZdCBjaGFuZ2UgdGhlIGFjdHVhbCBjb250ZW50cyBvZiB0aGUgTFVOIHZhcmlhYmxl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIEJ1bmtlciA8YnJpYW5AcHVyZXN0b3JhZ2UuY29t
Pgo+IF9fXwo+IC0tLSBhL2xpYm11bHRpcGF0aC9wcmludC5jICAgICAgMjAyMC0wOS0yNCAxMzo1
MjoxOC42NjE4MjgwMTEgLTA2MDAKPiArKysgYi9saWJtdWx0aXBhdGgvcHJpbnQuYyAgICAgIDIw
MjAtMDktMjQgMTQ6Mjg6MjcuNjAzNTQyMzAzIC0wNjAwCj4gQEAgLTM5NCw3ICszOTQsNyBAQAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19pZC5ob3N0X25vLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHBwLT5zZ19pZC5jaGFubmVsLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHBwLT5zZ19pZC5zY3NpX2lkLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19pZC5s
dW4pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIChwcC0+c2dfaWQubHVuICYgMHg0MDAwKSA/
IHBwLT5zZ19pZC5sdW4gLSAweDQwMDAgOiBwcC0+c2dfaWQubHVuKTsKPiAgfQoKUGxlYXNlIGlu
dHJvZHVjZSBhIGZ1bmN0aW9uIGZvciBjb252ZXJ0aW5nIHRoZSBMVU4gbnVtYmVyIGZvcm1hdCBh
bmQKYWRkIGFwcHJvcHJpYXRlIGNvbW1lbnRzLiBBbiBleGFtcGxlIGlzIGF2YWlsYWJsZSBoZXJl
OgpodHRwczovL2dpdGh1Yi5jb20vYnZhbmFzc2NoZS9zY3N0L2Jsb2IvYWRmYzY1NTEzOTE1MTc2
ZDlkODVhOWU5YzczNGQwYjI5OGE2Njk5MS9zY3N0L3NyYy9zY3N0X2xpYi5jI0wxMjExNwoKVGhh
bmtzLAoKQmFydC4KCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29t
Cmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

