Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8BDD5336
	for <lists+dm-devel@lfdr.de>; Sun, 13 Oct 2019 01:02:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FD9AC049E10;
	Sat, 12 Oct 2019 23:02:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D12035C226;
	Sat, 12 Oct 2019 23:02:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA5A84E58C;
	Sat, 12 Oct 2019 23:02:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CMxmYS015262 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 18:59:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80F6E60BF4; Sat, 12 Oct 2019 22:59:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1593460BF1;
	Sat, 12 Oct 2019 22:59:46 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A04B88385A;
	Sat, 12 Oct 2019 22:59:45 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y72so8188231pfb.12;
	Sat, 12 Oct 2019 15:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Ou3iWKMBM+z4z3059fUBojyoJ4nf1iLNh5xl/Uxvn4w=;
	b=UNCrv6Ezm6DidPLXlY+MoAdFktNXC4+u/QWsiNdNqMptt9qQMPNSrWoPyzkGR/OYdy
	2y0eyQATa0CH213XHkG+0Pw6WnDUiZmMBgb/Z6CX/XPEbKHoznwnScXnM6sUqFiJYUbb
	xrIHkTPYezItSOSg5h0YqtavH0k52ckOlVrecc/buOJYN4CBPLZtBcd56Xph0kh6/Frt
	fnsWFGRDgcSs1x1spMWX/SC3u9jZYD3aZ4FpZp3vRmNtO7Jnm8yKtqakcTp+XvJug1gx
	qO4EYJGcCKPBPVbwwpoHRRaekKHrwakDrovaR05N5EUrnn4eYd0sCQ4do1RNtmH/J3DL
	Qchg==
X-Gm-Message-State: APjAAAVv4DotHcvofyQxit4AyhbyND36cXt0Kund9W0/ptJFY6LvI2k3
	f7oli82w5xIRb6u9J0tKDkw07A8A
X-Google-Smtp-Source: APXvYqw7e05DstS30+OThY1sJ2o2iD1xh2PQuEH3ZxBg2OJFVtBMqnvjpPfzMNTey9rkmuCBdsZYbw==
X-Received: by 2002:a62:1c07:: with SMTP id c7mr24855133pfc.48.1570921184313; 
	Sat, 12 Oct 2019 15:59:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:647:4000:b9:f47b:c316:3f7b:9bb9])
	by smtp.gmail.com with ESMTPSA id
	d69sm15445441pfd.175.2019.10.12.15.59.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 12 Oct 2019 15:59:42 -0700 (PDT)
To: Martin Wilck <Martin.Wilck@suse.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-46-martin.wilck@suse.com>
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
Message-ID: <34e6fc87-10f6-efd7-c8df-710e56cc1956@acm.org>
Date: Sat, 12 Oct 2019 15:59:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191012212703.12989-46-martin.wilck@suse.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Sat, 12 Oct 2019 22:59:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Sat, 12 Oct 2019 22:59:45 +0000 (UTC) for IP:'209.85.210.194'
	DOMAIN:'mail-pf1-f194.google.com'
	HELO:'mail-pf1-f194.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.253  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.194 mail-pf1-f194.google.com 209.85.210.194
	mail-pf1-f194.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sat, 12 Oct 2019 23:02:03 +0000 (UTC)

On 2019-10-12 14:28, Martin Wilck wrote:
> -	if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part) >= bufsiz)
> +	if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part)
> +	    >= (int)bufsiz)
>  		return 0;

Please don't insert casts like this. I think enabling -Wsign-compare is
wrong because it makes the source code ugly.

Thank,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
