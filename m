Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A434840D
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 15:33:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B965A356F5;
	Mon, 17 Jun 2019 13:33:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60EC480DA4;
	Mon, 17 Jun 2019 13:32:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6007F149E1;
	Mon, 17 Jun 2019 13:32:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HDVf69003210 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 09:31:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15CE37E5B3; Mon, 17 Jun 2019 13:31:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06EEF7DF71;
	Mon, 17 Jun 2019 13:31:41 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2648A3001C61;
	Mon, 17 Jun 2019 13:31:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g135so9269888wme.4;
	Mon, 17 Jun 2019 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TK/taqnh4uTdUXYrgyPWRNDtNYlU83EQagbd52Vya7Q=;
	b=ENOJaDIcKIyM2ugEwPbDz5yXeyQ4yLGFt0UoLTW/SfFBEE1GI2WZm4B05Cd7QL89vm
	i0uC0fZ45h8c9+AtE188tELX/cImyDiX8JOdrOjRAPst2wYL72WdZkzlsLKHDbKwO88A
	fBFmMZpUnBGo/OcqPiFLq31dtZ7vEz5ltwwm5fW1BBQoxHLdm68UDAUY0eWDPuCJUMO6
	7HRMfUWEw3KrXVWJwrHfxbWhDffWtoEfx2r//PsTOBcWzfEFH4v6yI6qU44K4tN05rq5
	SPtgc4Ts8aT7Zs16DyZAZzSzKhli314JMqBmSk3V1umqS0zyyySyltYGB4IxrHJrp70g
	7cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TK/taqnh4uTdUXYrgyPWRNDtNYlU83EQagbd52Vya7Q=;
	b=cJ1MDRyCsWV/CfwQpxBUYA8UPoYcrHFM2pYyD+B2COZrD6UmSI7FP7y95y30pDoFdU
	7pMwjvQmew01ZNrRZ54tr97ZAH96O6N2wGW/mHYwDkcpVL84Btf3FL/FF0qJlZx2zYIv
	dFNEB/EgOiAJD/kIh9Zd5W+BujwxCsa8zMaU2eI6EdRW5UkFVuXakftv3lSpTGAJytdg
	p7XAzwdkO/4xnxznDUvKlHvgEqT7BMc6NuyaYZAMbb6PgzQ2vOthg4oLExv1BtOWnCjY
	6kGd4FG2QxlKH48TCIfPlFLeYEho/VmhqQXBzRrSjTOqXLE8n6Hk2HQ8OFIaqh+3KQ6c
	o9Nw==
X-Gm-Message-State: APjAAAV812G5t/3vYuqB3KNHGcWkxk2T8qTs1/+f6GuK5mrQxL6NVT5c
	b7kP6Mu5+F44T8+7sybaerqAT3MY5meKYA==
X-Google-Smtp-Source: APXvYqzEgy4mPVF+JIAdiL5lPe21YfSxEYStzjxJIEXrMdKSlb4M+1ecnl0Nvbc2TqZFJIsyNWZttw==
X-Received: by 2002:a1c:700b:: with SMTP id l11mr18910782wmc.106.1560778283508;
	Mon, 17 Jun 2019 06:31:23 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	q12sm8027900wrp.50.2019.06.17.06.31.22
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 06:31:23 -0700 (PDT)
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20190613010610.4364-1-jaskarankhurana@linux.microsoft.com>
	<20190613010610.4364-2-jaskarankhurana@linux.microsoft.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <ab346931-1d1b-bd2f-8314-ee4779bd44bf@gmail.com>
Date: Mon, 17 Jun 2019 15:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190613010610.4364-2-jaskarankhurana@linux.microsoft.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 17 Jun 2019 13:31:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 17 Jun 2019 13:31:25 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, snitzer@redhat.com, ebiggers@google.com,
	jmorris@namei.org, dm-devel@redhat.com, mpatocka@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v4 1/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 17 Jun 2019 13:33:44 +0000 (UTC)

On 13/06/2019 03:06, Jaskaran Khurana wrote:
...

> Adds DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE: roothash signature *must* be
> specified for all dm verity volumes and verification must succeed prior
> to creation of device mapper block device.

I had a quick discussion about this and one suggestion was
to add dm-verity kernel module parameter instead of a new config option.

The idea is that if you can control kernel boot commandline, you can add it
there with the same effect (expecting that root device is on dm-verity as well).

Isn't this better option or it is not going to work for you?

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
