Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2199843754
	for <lists+dm-devel@lfdr.de>; Thu, 13 Jun 2019 16:48:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 515DD308339A;
	Thu, 13 Jun 2019 14:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA6FE646AA;
	Thu, 13 Jun 2019 14:46:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EDCC206D2;
	Thu, 13 Jun 2019 14:45:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5DEgkgO016824 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Jun 2019 10:42:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B1807C58C; Thu, 13 Jun 2019 14:42:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 159087C584
	for <dm-devel@redhat.com>; Thu, 13 Jun 2019 14:42:43 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A7BE3091753
	for <dm-devel@redhat.com>; Thu, 13 Jun 2019 14:42:28 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c11so12882959qkk.8
	for <dm-devel@redhat.com>; Thu, 13 Jun 2019 07:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ayy/wuVFoF2wnJew0htcis3rAQwqjTEU204oPtBrM1k=;
	b=1oIj7yZ8Z/i8v3gjFXbgNCQPb8SoOst8yVAUsiCmRqFrHVuWD18Yn7OEsHRWE578ff
	hrlBrpjfEZ/Kt4UqbrgYSMyiCwT6tEL91kUrXStQB2uuCNo+yhQGsJmq+j/WePg2KLBq
	EBho9MqHSiJ/W8NM1WmKnMAKWrCymj2Qfb9+FSIj9N2TRAhMpgwybXLZ1Bxvw6cxVCdN
	NaxvQKJZCdHhC81V7qSWJepW0YZbESBMqm6vm6MkHB5/BaDAHO67XPalLwA6lT1b1DQZ
	MnDbz1CTF/PBd4skWXE656xs5Ax1gQ9SaLF5FcQubTMmkTft1tgMaNwmdbVW2FK2bW4p
	5obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ayy/wuVFoF2wnJew0htcis3rAQwqjTEU204oPtBrM1k=;
	b=LUpZlQetOBRdOrIGt/XjkH0PVyP1PQ0BoQCXMNiAJ4VEnqnkIwNMHHA91/mLECvjI8
	uHGXHExgwdA7S3ss3KCVNd45OYiWRoVDVEwcMib5E206f/M24LjyfNHf+s2cpyBc1BIK
	BjSpUCFT2yAYAYT8F/3lbAnlSm8piF+Re2LlzigJzZ/xsZPc2VE9c9jv2DYV8NrhSCJw
	0Uz4MZ8/8oFFHmTbvQw14eR/6kCR3qYTAIk6KHaNxbGhzO2xN2kC66+WChXSwKySdrAW
	x+utGM0M5yr+x6+KYVaz6+8jcL3MBnbHGoIYljO+qIgNuhsqDQIqrxaqDxNNI9AvdsKc
	Giqw==
X-Gm-Message-State: APjAAAXnH1bNhSfkvokk5duzIc0Ye6Uv/g4xsgSaZUvGB+gTC8n4a5BP
	Ng5MPyNN9THxRjyJhrcWDWccxw==
X-Google-Smtp-Source: APXvYqxoMHbi5i3+1lC6O3tu6rOJTMzxkhNviRwuo4YvReXzqz2JuHPEUa4pEgsOKi+NsVX1KVPukw==
X-Received: by 2002:a05:620a:147:: with SMTP id
	e7mr70729814qkn.247.1560436947557; 
	Thu, 13 Jun 2019 07:42:27 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::9d6b])
	by smtp.gmail.com with ESMTPSA id
	t80sm1500195qka.87.2019.06.13.07.42.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jun 2019 07:42:26 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:42:25 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: "zhangyi (F)" <yi.zhang@huawei.com>
Message-ID: <20190613144224.zxvi6tpmzcwsd33c@MacBook-Pro-91.local>
References: <1559741228-96463-1-git-send-email-yi.zhang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559741228-96463-1-git-send-email-yi.zhang@huawei.com>
User-Agent: NeoMutt/20180716
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 13 Jun 2019 14:42:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Thu, 13 Jun 2019 14:42:28 +0000 (UTC) for IP:'209.85.222.196'
	DOMAIN:'mail-qk1-f196.google.com'
	HELO:'mail-qk1-f196.google.com' FROM:'josef@toxicpanda.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.222.196 mail-qk1-f196.google.com 209.85.222.196
	mail-qk1-f196.google.com <josef@toxicpanda.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, snitzer@redhat.com, josef@toxicpanda.com,
	agk@redhat.com, houtao1@huawei.com
Subject: Re: [dm-devel] [PATCH v2] dm log writes: make sure the log super
 sectors are written in order
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 13 Jun 2019 14:48:13 +0000 (UTC)

On Wed, Jun 05, 2019 at 09:27:08PM +0800, zhangyi (F) wrote:
> Currently, although we submit super bios in log-write thread orderly
> (the super.nr_entries is incremented by each logged entry), the
> submit_bio() cannot make sure that each super sector is written to log
> device in order. So the submitting bio of each super sector may be
> out-of-order, and then the final nr_entries maybe small than the real
> entries submitted.
> 
> This problem can be reproduced by the xfstests generic/455 with ext4,
> which may complained below after running the test:
> 
>   QA output created by 455
>  -Silence is golden
>  +mark 'end' does not exist
> 
> This patch serialize submitting super secotrs to make sure each super
> sectors are written to log disk in order, so that we can prevent the
> latest nr_entries be rewritten by some old super bios.
> 
> Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
> Suggested-by: Josef Bacik <josef@toxicpanda.com>
> ---
> Changes since v1:
>  - Switch to use completion instead of wait_queue to synchronize
>    submitting super bios.
> 

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
