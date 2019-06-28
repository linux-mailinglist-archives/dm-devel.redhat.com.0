Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E976159343
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 07:13:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B1CB30820EA;
	Fri, 28 Jun 2019 05:13:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 054766013A;
	Fri, 28 Jun 2019 05:13:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0B711806B16;
	Fri, 28 Jun 2019 05:12:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5S5CPVn023758 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 01:12:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74F4C608D0; Fri, 28 Jun 2019 05:12:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31AC760606;
	Fri, 28 Jun 2019 05:12:21 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0ABF307D90F;
	Fri, 28 Jun 2019 05:12:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f15so4838241wrp.2;
	Thu, 27 Jun 2019 22:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SJl+MEcLHxsmC7hL4toqKB0JY3VqT6Z87x0g1KUG1aU=;
	b=Xj0afykFiahF870UUKq5lZkACMiX71h/r/Fjzqg0kwINVwRSXMJIdIxbMFTjvAmKKj
	r9aTY7HivgbiWpxz/UkX9PgvGJ72XaLblhYwGeSp6U1yFk62FguSSfYz0VS9a0/O3k3n
	5ZFZmFdkEvgaz24Ic8fH8oAamBFeBd71A2fqOha9ABaSH1jFBRN6voUSYFZ0yjbgBQ7a
	aIwH0sZXTZ+toSpmqi2C0BL/a98uHowFepcb1aWDJ4GtAmcbFRXJi/ACi2JtShWxiyS+
	j4+65Zfxv50nYfdJ+j6vXWB9anIuclvwSMlxR3cEx0VUf58aJWT8EQ7h61VaCBTqGV/D
	vw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SJl+MEcLHxsmC7hL4toqKB0JY3VqT6Z87x0g1KUG1aU=;
	b=jcldbNKEcZKzxsDuJtjO55HAwuCFNWuwge/vNczf8QNVGozdKof4rojEBtWt0V7Biw
	LA9CLWkJQigb6VqKF3UE/k1y1/zKA4PyYs21ElqPKRmLMDFibfl7DYiMDCxRm1TRU3cM
	s3h/0nOKTsHA3Ycbin9eHSCVHQP2V91ZlIotvWYK8WtL2EktiAZ0TWi7VsByh8c7xAe8
	CK76ZStCru5mKhBTh3mjiM1+xjVeNveWnVTjpi1REaqbcRyMdr2uau1svylMZAj0t2w3
	yTeul8uUVHQbzVZp/I3ni5zb7XzBHtAAqUucZIGXIrbddZfw7C5nCupccqbBdD8P1rWE
	2mtQ==
X-Gm-Message-State: APjAAAUHf6FwbGwHrbunIWEUBrkXgo9nPf7oa4JMYcS7p5I63y3XyyHx
	s2jQOnzcQy9lz66uFa1rNPofZmf4dXczjA==
X-Google-Smtp-Source: APXvYqw7iXg661+P0ytoSzuTlnML16T3d6/S3LFZw22cAgZe+5f7D14Z3sXNaeE4rKoyj1MqsaEQrg==
X-Received: by 2002:adf:de90:: with SMTP id w16mr5957398wrl.217.1561698731019; 
	Thu, 27 Jun 2019 22:12:11 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id a2sm2218310wmj.9.2019.06.27.22.12.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 22:12:10 -0700 (PDT)
To: Eric Biggers <ebiggers@kernel.org>,
	Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
	<20190627234149.GA212823@gmail.com>
	<alpine.LRH.2.21.1906271844470.22562@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
	<20190628030017.GA673@sol.localdomain>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <264565b3-ff3c-29c0-7df0-d8ff061087d3@gmail.com>
Date: Fri, 28 Jun 2019 07:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628030017.GA673@sol.localdomain>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 28 Jun 2019 05:12:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 28 Jun 2019 05:12:13 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 1/1] Add dm verity root hash pkcs7 sig
	validation.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 28 Jun 2019 05:13:09 +0000 (UTC)

On 28/06/2019 05:00, Eric Biggers wrote:
>> Hello Eric,
>>
>> This started with a config (see V4). We didnot want scripts that pass this
>> parameter to suddenly stop working if for some reason the verification is
>> turned off so the optional parameter was just parsed and no validation
>> happened if the CONFIG was turned off. This was changed to a commandline
>> parameter after feedback from the community, so I would prefer to keep it
>> *now* as commandline parameter. Let me know if you are OK with this.
>>
>> Regards,
>> JK
> 
> Sorry, I haven't been following the whole discussion.  (BTW, you sent out
> multiple versions both called "v4", and using a cover letter for a single patch
> makes it unnecessarily difficult to review.)  However, it appears Milan were
> complaining about the DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE option which set the
> policy for signature verification, *not* the DM_VERITY_VERIFY_ROOTHASH_SIG
> option which enabled support for signature verification.  Am I missing
> something?  You can have a module parameter which controls the "signatures
> required" setting, while also allowing people to compile out kernel support for
> the signature verification feature.

Yes, this was exactly my point.

I think I even mention in some reply to use exactly the same config Makefile logic
as for FEC - to allow completely compile it out of the source:

ifeq ($(CONFIG_DM_VERITY_FEC),y)
dm-verity-objs                  += dm-verity-fec.o
endif

> Sure, it means that the signature verification support won't be guaranteed to be
> present when dm-verity is.  But the same is true of the hash algorithm (e.g.
> sha512), and of the forward error correction feature.  Since the signature
> verification is nontrivial and pulls in a lot of other kernel code which might
> not be otherwise needed (via SYSTEM_DATA_VERIFICATION), it seems a natural
> candidate for putting the support behind a Kconfig option.

On the other side, dm-verity is meant for a system verification, so if it depends
on SYSTEM_DATA_VERIFICATION is ... not so surprising :)

But the change above is quite easy and while we already have FEC as config option,
perhaps let's do it the same here.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
