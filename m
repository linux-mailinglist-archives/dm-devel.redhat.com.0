Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A380D6BCC2
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jul 2019 15:08:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A2673083362;
	Wed, 17 Jul 2019 13:08:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FE346092D;
	Wed, 17 Jul 2019 13:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91F911800202;
	Wed, 17 Jul 2019 13:08:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HD8MSh015948 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 09:08:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49AAF60C67; Wed, 17 Jul 2019 13:08:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B560360BE2;
	Wed, 17 Jul 2019 13:08:17 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D702A3082134;
	Wed, 17 Jul 2019 13:08:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l2so22117935wmg.0;
	Wed, 17 Jul 2019 06:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=h2yLsvzismF8aSznQ40gS7iVeJd2FnjlYb1X34YBrA8=;
	b=hTIrJmKdb4eBexEx/Rfsp2Pg7LnciIrsWX1mLz99xre2zIlgoiZaRCMFERkDAw8DDI
	5SSzeqshErtNi7bSc3tgUmHN3HPsgCWWlvGsy5P/jXXVo0NoNhymFSNuVUOA4bwJMwQq
	MtK+PW3Kf6jxpRM6/m4vtBsrRPTyXrgx/CfumOVFW75rvSeMeoGDLotXbLZ4dZj9XvW8
	zdFqWe7FC1i2CMy81xtbA8AfUzcU8z4KSd/Vr3Dpsm935/ni2Spayq5xnOomWsic77dq
	G/PfZx5IhgH+2aj5ZUt9rXZNbq+d9eLIiBIHkaNMX3oLc2RTPfkQ84cO11KPR8XNTi+r
	Hnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h2yLsvzismF8aSznQ40gS7iVeJd2FnjlYb1X34YBrA8=;
	b=QUNOvkCarGlP9fvjZk+RE2glF2FLMUHAOBIJLwk0Ll2yVY46BvQnQRCu1WG76JSNgE
	ukbE047zxxQgFc3bm+5sANGyVhbg//3bSs11LkBSa2mPRn/GUvbYoANpFzx5OnhlTar3
	Oap5D2eJPSBjx8nXqmsSKQ8RPOZzr9R+EWdC8IHSVuUL6tnG5HQqH4UTUBEyfqeEzqxH
	4IwgNclrXvPYvAGT2V7baafZSEDK/dvwJZd6Vzozo8PHieGe7hdF8324Mwg4qczhDWf7
	kY/4B+yWf03LtkyI5+IYRQuYt1z4tQCymSvwxhXTqMGcIdEq9kE4m7c2OJAO76EfKTbY
	Sa+A==
X-Gm-Message-State: APjAAAUFqFtXrr6DW9LM4+tMyW/owmGkyrASdkKfcH8YfVhctwoxb4cP
	XIRoo6/rtUsyO3Ryje5qYnQSqlvYzWM=
X-Google-Smtp-Source: APXvYqwizHNDm7V2q4Zl8PfRLV8uyVMUdooEDkuQU8R8qdODhQ4UauaxynjAA3/s6qsYZwd+jj1eJQ==
X-Received: by 2002:a1c:9a53:: with SMTP id c80mr34774771wme.173.1563368895160;
	Wed, 17 Jul 2019 06:08:15 -0700 (PDT)
Received: from [10.43.17.52] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	n12sm24739515wmc.24.2019.07.17.06.08.13
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jul 2019 06:08:14 -0700 (PDT)
To: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
References: <20190701181958.6493-1-jaskarankhurana@linux.microsoft.com>
	<MN2PR21MB12008A962D4DD8662B3614508AF20@MN2PR21MB1200.namprd21.prod.outlook.com>
	<alpine.LRH.2.21.1907121025510.66082@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
	<395efa90-65d8-d832-3e2b-2b8ee3794688@gmail.com>
	<alpine.LRH.2.21.1907161035490.121213@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <bdcd7d7c-92fc-11af-7924-9bd0e184b427@gmail.com>
Date: Wed, 17 Jul 2019 15:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1907161035490.121213@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 13:08:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 13:08:17 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Scott Shell <SCOTTSH@microsoft.com>, dm-devel@redhat.com,
	snitzer@redhat.com, ebiggers@google.com,
	Nazmus Sakib <mdsakib@microsoft.com>,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v6 0/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 17 Jul 2019 13:08:50 +0000 (UTC)

Hi,

On 16/07/2019 20:08, Jaskaran Singh Khurana wrote:
>>> Could you please provide feedback on this v6 version.
>>
>> Hi,
>>
>> I am ok with the v6 patch; I think Mike will return to it in 5.4 reviews.
>>
> 
> Thanks for the help and also for reviewing this patch. Could you please 
> add Reviewed-by/Tested-by tag to the patch.

ok, you can add
Tested-and-Reviewed-by: Milan Broz <gmazyland@gmail.com>

or just use the version on my git, I already updated few lines because
of recent kernel changes, mainly the revert of keyring changes, tested patch is here

  https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git/commit/?h=dm-cryptsetup&id=266f7c9c74b23e4cb2e67ceb813dd707061c1641
...

> The steps and workflow is correct. I will send the cryptsetup changes for 
> review.

ok, I'll probably try to use our existing userspace libcryptsetup API to avoid introducing new calls,
but that is not important for now - the kernel bits must be in the mainline kernel first.

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
