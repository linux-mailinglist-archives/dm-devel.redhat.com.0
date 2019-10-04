Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E6CBF07
	for <lists+dm-devel@lfdr.de>; Fri,  4 Oct 2019 17:21:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC83510C0930;
	Fri,  4 Oct 2019 15:21:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A544107;
	Fri,  4 Oct 2019 15:21:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD4A24EE68;
	Fri,  4 Oct 2019 15:21:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94FH1SH030170 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 11:17:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A3725DA60; Fri,  4 Oct 2019 15:17:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34C255D9DC;
	Fri,  4 Oct 2019 15:16:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AB71AD880;
	Fri,  4 Oct 2019 15:16:58 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p14so6749272wro.4;
	Fri, 04 Oct 2019 08:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=cNbt08lMY61jlsTbyVEVxQG74tBa2ALDeHtjjzGpBF8=;
	b=uNtTruME1xQPwCcdreB4QICPxgz4RL+2am+eTWyu0ddWjabIQO9r6pZF2Up/bfBzp3
	rqi85lNQU0iAdaJxGJoCt1mQ7nfFtcPTdBGoxTzShh/Dm6bpkcWHO/i+RP4PMZ8B4V/j
	TOQe7CKqKrYcihvVU5KeFkpAVg6PF6b6ItAbQvK3JT1QpmFu/Jvt9+2OVUewx69bNND9
	H6NPJXqkFaDwS8O/UX6FVfZtB9++BBHVLCJ9lBA2Df5yLKloWSGf1bdNwhg6raYM5dNq
	POLGBEqT2nmEZIWL7JtjAITzwsclqpQ4+6R2uHKXYN1VPhvsAWJOla2XO0t7BhL6GQ+M
	sefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cNbt08lMY61jlsTbyVEVxQG74tBa2ALDeHtjjzGpBF8=;
	b=JuvXGsxSubG2XGOCDaKeNlC30Q6uxWPExmhkrv8FG+gdHRQD6DD2aCbqcWrBP57XX4
	qZIsfl6SusqWaU0AkRgVYPE7yd5N7Z4d94Og+N5KSqKWhcLnPV1lZjqBCZPX9SFrBjD3
	pN4HnmaYfN/Hg+zUjmtjGxiEgteLk3XfQtncgLuxZNQPdXfnKT3wPkBKXSQvNke/7EWF
	wG+/l/dGgot9GikFSKjX5qjU3xptsgCzH7c4KcBtRxe91rleH2CZ9vDEfMbcG23FqPQj
	/h1Z4SJIzZUpA5tqYwFGHmj2OQAAzFSo05PWC2r4OqT2k0S5tAP50WqPLFRs6+kPeGEZ
	KieQ==
X-Gm-Message-State: APjAAAUajjaN4Ew6BSOI9Bt4/0KQeAeh3a7QyEtaltjYoasduZuAGFi3
	lHDeq7/DWY3iiyWYGk/iCg==
X-Google-Smtp-Source: APXvYqw/ARP+S1kHqERM6xLMCoK51GeuqLTXqX30wOP11tGUAWCq8NYBD0/SN14Gg13Usj4wsQ3LsQ==
X-Received: by 2002:a5d:568d:: with SMTP id f13mr11647715wrv.162.1570202216022;
	Fri, 04 Oct 2019 08:16:56 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	g11sm7333180wmh.45.2019.10.04.08.16.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 04 Oct 2019 08:16:55 -0700 (PDT)
To: Martin Wilck <Martin.Wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>
References: <e2b955d0-69ea-2c2b-9f0f-ccf3b5f369d0@gmail.com>
	<20191003214420.GE25414@octiron.msp.redhat.com>
	<5d38873e4ea51f00d1d49e9e9fb86419542598e8.camel@suse.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <7d9b044e-9da9-7009-dd4f-f38621d40153@gmail.com>
Date: Fri, 4 Oct 2019 17:16:54 +0200
MIME-Version: 1.0
In-Reply-To: <5d38873e4ea51f00d1d49e9e9fb86419542598e8.camel@suse.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 04 Oct 2019 15:16:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 04 Oct 2019 15:16:58 +0000 (UTC) for IP:'209.85.221.48'
	DOMAIN:'mail-wr1-f48.google.com' HELO:'mail-wr1-f48.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.48 mail-wr1-f48.google.com 209.85.221.48
	mail-wr1-f48.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Hannes Reinecke <hare@suse.com>
Subject: Re: [dm-devel] multipath-tools: RH-patches for upstream ???
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Fri, 04 Oct 2019 15:21:44 +0000 (UTC)

On 10/4/19 9:03 AM, Martin Wilck wrote:

>>> https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0029-RH-Fix-nvme-compilation-warning.patch
>>>
>>>     Subject: [PATCH] RH: Fix nvme compilation warning
>>>
>>
>> I assume that other people aren't seeing these compilation warnings,
>> and
>> this it due to different options that redhat uses when compiling.  I
>> really should push this patch upstream, but that upstream isn't
>> multipath-tools, its nvme-cli, where we copied this file from. Once
>> it's
>> changed there, we can pull the updated files back to multipath-tools.
> 
> Ack. Which compiler option triggers this warning?

With this patch: https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0024-RH-use-rpm-optflags-if-present.patch
and /usr/lib/rpm/redhat/redhat-hardened-cc1 :
*cc1_options:
+ %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
