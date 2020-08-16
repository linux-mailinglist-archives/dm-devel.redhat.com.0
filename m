Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6A5245597
	for <lists+dm-devel@lfdr.de>; Sun, 16 Aug 2020 05:53:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-FeY555kCMOuep-FygZ4Azw-1; Sat, 15 Aug 2020 23:53:06 -0400
X-MC-Unique: FeY555kCMOuep-FygZ4Azw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FEF6801A9D;
	Sun, 16 Aug 2020 03:52:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BD6918535;
	Sun, 16 Aug 2020 03:52:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C36F9180B655;
	Sun, 16 Aug 2020 03:52:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07G3oHnd004039 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 23:50:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5341B0785; Sun, 16 Aug 2020 03:50:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E74F94655
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 03:50:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83BBF80121C
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 03:50:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-wuamWTJEM6-JmNo1LJnHsA-1; Sat, 15 Aug 2020 23:50:11 -0400
X-MC-Unique: wuamWTJEM6-JmNo1LJnHsA-1
Received: by mail-wr1-f52.google.com with SMTP id a15so11642267wrh.10
	for <dm-devel@redhat.com>; Sat, 15 Aug 2020 20:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=daLKsBxPcu+hAJqVA8YmyHs1CkzK/c0HX0c27jZrvkQ=;
	b=EhEVbW0tpQ5PvdLobSsbYgiRs2qrAAW/6v4PvllNQOfPx9uxmofaXE3f7Sxkr1nIcW
	hXCkjdflIdzQwazetTK+j6nBckmf+RbP00ZFHfFk2MM+u4Wru3qeERAMLDD7dYtw1bxN
	vK3Itru9v/xVHgiGlonEZXA19DSlqRSS4TvrcZoKuZVntWzUrx4X+H278KTEvN70d2Db
	5tmmM1ez2gdxD5j/GPquYMLQ8yLjlLd9c1KozZe/F+2relxG4MfV1xUhpRBmda48VvrD
	Bc/frPmViwjCmpvXAFDvxHYD5u4opBoNA6Y3oWlfiHGydKTSbJiE1NTRnWJYn1xZT4Al
	JW6A==
X-Gm-Message-State: AOAM531pWHlyHdOGzR1gSIItebIUvHkT4TFbvUafGCNwfFRAAmrXWF1r
	RIoY34qL3SNHArNR/qiAMFLKIdtvsA==
X-Google-Smtp-Source: ABdhPJzLUuHxQNDjcV5C5htNamvu7JgE9hKLt1oIB0TON0+TiWXtR4WE8BbnGamrKq1Vua3rTfEvrQ==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr9029075wrm.3.1597549810648;
	Sat, 15 Aug 2020 20:50:10 -0700 (PDT)
Received: from localhost (154.red-83-37-107.dynamicip.rima-tde.net.
	[83.37.107.154]) by smtp.gmail.com with ESMTPSA id
	x82sm24354041wmb.30.2020.08.15.20.50.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 15 Aug 2020 20:50:10 -0700 (PDT)
To: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
References: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
	<8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
	<20200813235143.GB2644@mayhem.atnf.CSIRO.AU>
	<f9f8c62f-fa97-dbcb-52dd-503d392df95f@gmail.com>
	<20200814021835.GD2644@mayhem.atnf.CSIRO.AU>
	<30d53099-24dd-254a-13f2-9f1a488c1773@gmail.com>
	<20200816023037.GA13633@mayhem.atnf.CSIRO.AU>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <a00b22c2-64ba-4c2b-03a5-cc955d6c476c@gmail.com>
Date: Sun, 16 Aug 2020 05:50:09 +0200
MIME-Version: 1.0
In-Reply-To: <20200816023037.GA13633@mayhem.atnf.CSIRO.AU>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 8/16/20 4:30 AM, McIntyre, Vincent (CASS, Marsfield) wrote:

> Promise recommend the multibus option,

Promise docs are a bit messy. The multibus example is a mistake.

There are only two options for this array: failover or group_by_prio.
There are plenty of examples, for old distributions, at
"Linux PerfectPath - Promise Multipath Driver", under:
https://www.promise.com/Support/DownloadCenter/VTrak/Ex30/E830f#Utilities

> Thanks for your analysis. The model is VTrak E830f (VTE830fD).
> The unit is definitely set to active-active controllers.

Yep, it's a dual controller array. But the controllers are no able to
access to a LUN at the same time, and from all paths.

Only high-end arrays(3PAR, Symmetrix, DS8000, ONTAP, VSP, ...) do this.

In VTrak arrays, one LUN is owned only by one controller.

> The firmware could use an update however, the latest release
> seems to have been overlooked. I'll try updating and look
> into enabling ALUA support.

If ALUA is not used, multipathd must be configured with the
"failover" option for "path_grouping_policy"

> One question about the man page though.
> it seems from the current text that putting
>    hardware_handler     "0"
> in the config would be ignored for arrays that are
> assumed to have ALUA support.
> However if the array has ALUA support turned off and
> multipathd detects this, then the package falls back to using
>    hardware_handler     "0"
> of its own accord?
> If that's correct, could that be added to the man page?

Debian 10 is using a very old multipath-tools release (0.7.9 - nov 2018)
without any upstream fixes. I don't know if it's an old bug or
the default setting "hardware_handler = 1 alua" was interfering.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

