Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A76D03F3525
	for <lists+dm-devel@lfdr.de>; Fri, 20 Aug 2021 22:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629490864;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1nAH2QoHcSHucOurGqP5tI+O3a05vPX/QkgYNo59las=;
	b=aiuq/nPqpgmk0O8Dj1OvfimpVr0DbgXQSSH2+u20hu8eSIfIn2rzwXc3tAJe+7/Q3Dtb9l
	Lx/s4lBybjBO93U4DoIA+zl/jzLyHxW+0na9/PB3Lo9VxPXDVVaxrrX1UnLPOTXt46LLZW
	yb1Y2Z4z1xXfjE6RQTf+BIfFYKM3Bzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-VMqFZwzfNOWlyiW8QdxoxQ-1; Fri, 20 Aug 2021 16:21:02 -0400
X-MC-Unique: VMqFZwzfNOWlyiW8QdxoxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 328A2875108;
	Fri, 20 Aug 2021 20:20:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 839535D6B1;
	Fri, 20 Aug 2021 20:20:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2656D181A0F8;
	Fri, 20 Aug 2021 20:20:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KKJV4g019261 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 16:19:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5949117DB36; Fri, 20 Aug 2021 20:19:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1018117DB34
	for <dm-devel@redhat.com>; Fri, 20 Aug 2021 20:19:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7200866DF9
	for <dm-devel@redhat.com>; Fri, 20 Aug 2021 20:19:28 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-447-D9krZx4fN2e_1lLw68CJ8w-1; Fri, 20 Aug 2021 16:19:27 -0400
X-MC-Unique: D9krZx4fN2e_1lLw68CJ8w-1
Received: by mail-qk1-f199.google.com with SMTP id
	k5-20020a05620a414500b003d5da483eafso4253392qko.22
	for <dm-devel@redhat.com>; Fri, 20 Aug 2021 13:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=e0xk0PCgbvrI9oL4egy0zV/DTKLD6KkoLQ6vPavMKGE=;
	b=eDt9OMpDbcrXYlzQnKgg75P8p/E0b2TwNOtnSFooo7xFA9Q/4yagJ2UEvRn9YVf94W
	S1vvimlCuUHzgQfcnJxvwBnOI9r+7tsyxCJzHr6nxepf/MiuBCV8Q6A3zKmqbv2AjcHH
	u4A928SdWYs9THAlcv21xC3CMyUjkWe885lNN+THxKcO7UcuxDx5WmFMjlcIzQj41hKa
	8wi4wMLyx/o0ujV9/ODt1IqtHeSl4cCsLzthFOVtvQauA+XttDwSj7wU1eaflYDEkW8o
	R53VtTiJ9dWe6J6S7lkh37HvEGhX0YPHEsaBqlR7PkHbYSKSWpIwMmAnvZ7WYGCIjG1R
	MHEA==
X-Gm-Message-State: AOAM5318JwN6puJRXqLn4mJGDfnfs9Gn8zgMKmAQJKYfBusw1/h0R7tZ
	BHKMlq44+kRCRKzVdr0YG1CNPM+OPD90w4ZDBuLOkBv85aYVXZJOJcI7RhjcgjaYpM2aU5Vhuot
	sOjonzJ7IEZ0PyA==
X-Received: by 2002:ae9:f701:: with SMTP id s1mr4317130qkg.223.1629490766944; 
	Fri, 20 Aug 2021 13:19:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb2iDL3pszKH41Z1jgPp9S39r1QoXK1jvTsWR2PAHnl9VBPP2M+hZZXFZGgTA1ObYjix4Usw==
X-Received: by 2002:ae9:f701:: with SMTP id s1mr4317111qkg.223.1629490766730; 
	Fri, 20 Aug 2021 13:19:26 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	a14sm2768090qtb.57.2021.08.20.13.19.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Aug 2021 13:19:26 -0700 (PDT)
Date: Fri, 20 Aug 2021 16:19:25 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <YSAOTX+TQwaCUeCn@redhat.com>
References: <20210813213801.297051-1-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20210813213801.297051-1-tusharsu@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: sfr@canb.auug.org.au, zohar@linux.ibm.com, linux-block@vger.kernel.org,
	nramas@linux.microsoft.com, dm-devel@redhat.com, public@thson.de,
	linux-integrity@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/6] updates to device mapper target
	measurement using ima
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 13 2021 at  5:37P -0400,
Tushar Sugandhi <tusharsu@linux.microsoft.com> wrote:

> 
> There were several improvements suggested for the original device mapper
> target measurement patch series [1].
> 
> Those improvement suggestions include: 
>  - Prefixing hashes for the DM tables being measured in ima log with the
>    hash algorithm.
>  - Adding version information for DM related events being measured in the
>    ima log.
>  - Prefixing DM related event names with "dm_".
>  - Including the verity target attribute - "root_hash_sig_key_desc"
>    in the ima measurement log.
> 
> This series incorporates the above suggestions.
> 
> This series also has the following fixes:
>  - Adding a one-time warning to dmesg during dm_init if
>    CONFIG_IMA_DISABLE_HTABLE is set to 'n'.
>  - Updating 'integrity' target to remove the duplicate measurement of
>    the attribute "mode=%c".
>  - Indexing various attributes in 'multipath' target, and adding
>    "nr_priority_groups=%u" attribute to the measurements.
>  - Fixing 'make htmldocs' warnings in dm-ima.rst.
>  - Adding missing documentation for the targets - 'cache', 'integrity',
>    'multipath', and 'snapshot' in dm-ima.rst.
>  - Updating dm-ima.rst documentation with the grammar for various DM
>    events and targets in Backus Naur form.
>  - Updating dm-ima.rst documentation to be consistent with the code
>    changes described above.
> 
> This series is based on top of the following git repo/branch/commit:
>  Repo: https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
>  Branch: dm-5.15
>  Commit: commit 5a2a33884f0b ("dm crypt: Avoid percpu_counter spinlock contention in crypt_page_alloc()")
> 
> 
> [1] https://patchwork.kernel.org/project/dm-devel/cover/20210713004904.8808-1-tusharsu@linux.microsoft.com/
> 
> Tushar Sugandhi (6):
>   dm ima: prefix dm table hashes in ima log with hash algorithm
>   dm ima: add version info to dm related events in ima log
>   dm ima: prefix ima event name related to device mapper with dm_
>   dm ima: add a warning in dm_init if duplicate ima events are not
>     measured
>   dm ima: update dm target attributes for ima measurements
>   dm ima: update dm documentation for ima measurement support

Hi,

I reviewed and staged these changes in dm-5.15 (and for-next) with
minimal tweaks. Really just some whitespace and a simplification of
the conditional for the warning in dm_init().

Please make sure that you manually apply Christoph's fix for the issue
you reported earlier in the week, you were cc'd on the ultimate fix
which has a different patch header than this patch but on a code level
it is identical (and only patch that landed on a public mailing list
due to typo in linux-block email address when hch sent the final fix):
https://listman.redhat.com/archives/dm-devel/2021-August/msg00154.html

It is an issue that'll linger in the dm-5.15 because I cannot rebase
at this late hour even once Jens picks the fix up into the
linux-block tree.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

