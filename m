Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B497FE41D9
	for <lists+dm-devel@lfdr.de>; Fri, 25 Oct 2019 04:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571971947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=ixyPJUuKThW3fs3TXEpdhSVx9g+e5D7tExouWbrRfKc=;
	b=fsr6pcTYLSWaPgEAi6VGGRFUFyawAlVF96pEZK3cF/PyGszg29T/rlYqz03y/eaOO84hsV
	xAusawoX5mlzIvnOpNIzpNTO5LEro6mTajIqHbdZJl+yMQudyzhQ3MSAdOF3B2RtD02xLb
	a405W2B8EQeQJaiJTITatkfsxyJyljc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-bks0GFYTMcWiJcTeX27g5g-1; Thu, 24 Oct 2019 22:52:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1BAC801E5C;
	Fri, 25 Oct 2019 02:52:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCD5E5C1B5;
	Fri, 25 Oct 2019 02:52:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B07D4A486;
	Fri, 25 Oct 2019 02:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9P2pnLP002755 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 22:51:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DCB25DA8D; Fri, 25 Oct 2019 02:51:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37B505D9CA;
	Fri, 25 Oct 2019 02:51:47 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89E953084212;
	Fri, 25 Oct 2019 02:51:46 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q7so546669pfh.8;
	Thu, 24 Oct 2019 19:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=x+pZZ2/bdftRJGILqWuQW2A81wFe5H6VWzO7riXgxKY=;
	b=QBzbTA2THCEoicsob6gErVE1Y+xBLZZGEvRfdc/sfpsrdeQYlsaXeP+824TaO5AWDN
	3nkkpDGOxauLuGU1jKtGe/1jYJUHn1VcYlxBewC06l3McKvGOp9KDp7LcuxGN4cZVydy
	7rXnjCBv7Tn3sI50D53Gg558puVaZau1YK/ReaXLHE68d+VhfEdSJvM1Lk91gFoOW6ox
	dOZalqYAf9mDZF4NWvVMR0x43lm8mIuzqvZL/3MO4X+5sqy+W0PV0S0SEU7XlY7OGVKo
	jFYz1gXd7vxQw65hXbifAa6BgaqrYDmyInxuG1X+uK7vOMC9KI1/kWegStF0rJNOOrfN
	01fw==
X-Gm-Message-State: APjAAAUR2AH8q9Rdp779jHSXlEjLWftvUyktlbzWQIgJVGqeNOdiG3uf
	AmiABdMqf7NbKCRdpAXP5r3JCgNq
X-Google-Smtp-Source: APXvYqyoxI7pJ7Sa7krZ20B1I+tMXH/20UCnQVs1QSJR6N2UP456XEMgOZucWi44nVeI2QOn+vPJBg==
X-Received: by 2002:a63:ce51:: with SMTP id r17mr1462824pgi.16.1571971905389; 
	Thu, 24 Oct 2019 19:51:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:647:4000:c3:edab:ea82:1105:d203])
	by smtp.gmail.com with ESMTPSA id
	j26sm402680pgl.38.2019.10.24.19.51.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 24 Oct 2019 19:51:44 -0700 (PDT)
To: Martin Wilck <Martin.Wilck@suse.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>
References: <20191024150556.19575-1-martin.wilck@suse.com>
	<20191024150556.19575-2-martin.wilck@suse.com>
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
Message-ID: <26742e32-731b-f62b-a230-f41d0ee67da9@acm.org>
Date: Thu, 24 Oct 2019 19:51:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191024150556.19575-2-martin.wilck@suse.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 25 Oct 2019 02:51:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 25 Oct 2019 02:51:46 +0000 (UTC) for IP:'209.85.210.194'
	DOMAIN:'mail-pf1-f194.google.com'
	HELO:'mail-pf1-f194.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.465  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.194 mail-pf1-f194.google.com 209.85.210.194
	mail-pf1-f194.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 45/72] libmultipath: fix -Wsign-compare
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: bks0GFYTMcWiJcTeX27g5g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On 2019-10-24 08:06, Martin Wilck wrote:
> +#define safe_snprintf(var, size, format, args...)=09=09=09\
> +=09({=09=09=09=09=09=09=09=09\
> +=09=09size_t __size =3D size;=09=09=09=09=09\
> +=09=09int __ret;=09=09=09=09=09=09\
> +=09=09=09=09=09=09=09=09=09\
> +=09=09__ret =3D snprintf(var, size, format, ##args);=09=09\
> +=09=09__ret < 0 || (size_t)__ret >=3D __size;=09=09=09\
> +=09})

How about adding a comment that explains the meaning of the returned
value? Otherwise this patch looks fine to me. Thank you for having done
this rework.

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

