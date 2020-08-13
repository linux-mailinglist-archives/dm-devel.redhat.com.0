Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 32BAA243FA4
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 22:08:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-niTTk3oiM0egidHKWhyJog-1; Thu, 13 Aug 2020 16:08:37 -0400
X-MC-Unique: niTTk3oiM0egidHKWhyJog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BF62801AAF;
	Thu, 13 Aug 2020 20:08:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4595D759;
	Thu, 13 Aug 2020 20:08:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B59281826D2A;
	Thu, 13 Aug 2020 20:08:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DK7xgi025567 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 16:07:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 097B31111C6B; Thu, 13 Aug 2020 20:07:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 053541111C6A
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 20:07:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED3E7185A78B
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 20:07:55 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-97-l895evPFMwOObP5__waWcQ-1; Thu, 13 Aug 2020 16:07:52 -0400
X-MC-Unique: l895evPFMwOObP5__waWcQ-1
Received: by mail-wr1-f66.google.com with SMTP id 88so6415918wrh.3
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 13:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fLfFBXQVPO9OhJHclJIm+QA4dGMhsFc+WqPozwy0vqs=;
	b=PL5p6IW67DL7aCOObL7VxYaoB3YrC1O07wVxwsBSLKtahP9h2S5U0re9KXBVYSPNiT
	ZpMTzwWvRGCJl2oUeqTZH9m84ztkRic0Y3Y//i+mGq1DNUtizePAT3t3+MDRjcwy+Jst
	mQ2D76VmFp+Ecoakp2Pd/nReOEqBGuYDjqmiD17+lucNT/MadpJbt0tNmOlPfvNxUC3P
	SghfHFjFLIHp5puoxE39kF8jdhMJzLQrxYZqApf1sOeRT78vXqoHiATU4fhXw8/Q24+N
	BxvDSacih1wQQvEA2rvlbb6ittF4pywyJwS/2fJ/MMPEEJ79galQn8uBfiG7rAy9TUmB
	vibw==
X-Gm-Message-State: AOAM530mjxXoZZREigZd2BxFGtJISOmZELpA/E8GeB6kqp6kNxLJsHPg
	YhB9q8IQAlwc0JxErUq5vCVQRks=
X-Google-Smtp-Source: ABdhPJxKg3+BA9R8jxZF6DF4ZKOAIb42y6nAGqCO+WxrJUcr6fOtBrUa1fs3Wy6NuRlYY2uHE0k2XQ==
X-Received: by 2002:adf:b302:: with SMTP id j2mr5487225wrd.294.1597349271392; 
	Thu, 13 Aug 2020 13:07:51 -0700 (PDT)
Received: from localhost (201.red-83-37-180.dynamicip.rima-tde.net.
	[83.37.180.201]) by smtp.gmail.com with ESMTPSA id
	i82sm11215776wmi.10.2020.08.13.13.07.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Aug 2020 13:07:51 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
Message-ID: <8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
Date: Thu, 13 Aug 2020 22:07:49 +0200
MIME-Version: 1.0
In-Reply-To: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] Promise and ALUA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 8/10/20 6:33 AM, McIntyre, Vincent (CASS, Marsfield) wrote:

> for many years we have been operating some Promise VTrak arrays
> without any use of the ALUA feature (largely so we don't have to
> specify LUN affinities as well, which seems to be required).
> 
> In the process of upgrading to Debian Buster
> (multipath-tools 0.7.9 and kernel 4.19)
> I find that I can no longer connect to our Promise arrays.
> They are detected but the only useful output I get is
> 
>   multipathd[986]: reconfigure (operator)
>   multipathd[986]: sdc: alua not supported
>   multipathd[986]: sdd: alua not supported
>   multipathd[986]: sdr: alua not supported
>   multipathd[986]: sde: alua not supported
>   multipathd[986]: sdf: alua not supported
>   multipathd[986]: sdg: alua not supported
>   multipathd[986]: sdh: alua not supported
>   multipathd[986]: sdi: alua not supported
> 
> 
> I found the note in the manpage about alua being selected by
> default for these arrays[1], but I'm taken aback that I'm not
> allowed to override this.
> 
> Is there really no support any more for choosing whether to use
> ALUA or not?
> 
> I have tried messing about with detect_prio, dectect_checker
> and whatnot, to no avail.

> [1] 9b5ea2eda85ae072cb697310807611c693713c2b
>      libmultipath: retain_attached_hw_handler obsolete with 4.3+

With the next array config and an empty /etc/multipath.conf,
reboot the linux host and put the output of "multipath -ll"
Redundancy Type: Active-Active
LUN Affinity: Enable
ALUA: Enable

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

