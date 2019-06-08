Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139D39BED
	for <lists+dm-devel@lfdr.de>; Sat,  8 Jun 2019 10:53:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A008F3082AE5;
	Sat,  8 Jun 2019 08:53:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18FA160BE5;
	Sat,  8 Jun 2019 08:53:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E62111806B0F;
	Sat,  8 Jun 2019 08:52:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x588kTov031544 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 8 Jun 2019 04:46:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4238260BF1; Sat,  8 Jun 2019 08:46:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8BC860BE5;
	Sat,  8 Jun 2019 08:46:24 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FFBE308213A;
	Sat,  8 Jun 2019 08:46:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so4349453wrs.5;
	Sat, 08 Jun 2019 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3N/XFRIaKbINErkXA+aSRWo990wI94tbeX8s5X2Uaok=;
	b=Yzk2WxKg7rUSYJvzOSUtot05gkixTAjFdinc4pTAR6dcHnA/TbGQmOlDbabUzd/7h5
	5oiu8LoTp/om2qc+qhknzxPaexWfTNo4VA/XIUzNQnc8OLpUeGT0O9sX65q5YPXcvMVa
	paHoegJQx0Rtbbges9CoF5JW5ZQwedsgBjKvwuUvMWv+FbyKv64RDQdzvZwz3wRe5zwk
	nWAJ8jnePsqSc9CnJdRxjjalJQRjPSVf3wG9P5MdG20Wbv/fH9he9Hx+kFCE77fIrvvT
	pfVxE3tU5XhjT7I+oQ86XffBGfwNdqb4cSFjiIctNbhVHjv6oUl9MbkzUg6U3NMYvonF
	gACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3N/XFRIaKbINErkXA+aSRWo990wI94tbeX8s5X2Uaok=;
	b=JVt2YebL1SgBwdpDBU/lHh2/AntmuOBLinC/xH+C5dqBXih652DnIltDswWnNQnD7r
	nFyiYXWFrbm9y9dj3nYgSslYH5OtF8rfrcDlcP+uetKwzmKSR1HSlu+xv4OwyJM8O/oF
	UxGSvut4Ga3NlwzTxQVKgF6iWgWECUaa0C6C2B5C1gWJP2crnE8U2di/VO/xFKcGiJD7
	flouUkyuQrHYwpRRcMPJE7SDQG1gE3LyqmeQ+54Hd6da6swXyEJurqB71ir2fRoG0h/H
	uSy8uDGPPpYqK7jMw15HKPbz0yKGShJCrnuWxLI4SHZKfcwxUky9qIQdlfyp9KamKysZ
	1EOA==
X-Gm-Message-State: APjAAAVqyvZdbY5PcPNx9pGQLK+joapP2jkZBMWGG68npxe+dvqQgSUK
	BZhKlaWhfeW2KUo53+BEkug+463TOoU=
X-Google-Smtp-Source: APXvYqzN5HNc4x2T6imkzJNU+3V1TV0C0bzXb7kG4XLciS740u6uhJE5AUd2bEetnnwapCXYtIdpAw==
X-Received: by 2002:adf:db02:: with SMTP id s2mr1363063wri.326.1559983582470; 
	Sat, 08 Jun 2019 01:46:22 -0700 (PDT)
Received: from [192.168.8.100] (37-48-58-25.nat.epc.tmcz.cz. [37.48.58.25])
	by smtp.gmail.com with ESMTPSA id
	v24sm3089236wmj.26.2019.06.08.01.46.21
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jun 2019 01:46:21 -0700 (PDT)
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20190607223140.16979-1-jaskarankhurana@linux.microsoft.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <3f9f2df1-c811-18d4-2665-0ffddb7a7f0e@gmail.com>
Date: Sat, 8 Jun 2019 10:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607223140.16979-1-jaskarankhurana@linux.microsoft.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 08 Jun 2019 08:46:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Sat, 08 Jun 2019 08:46:24 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.706  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, snitzer@redhat.com, ebiggers@google.com,
	jmorris@namei.org, dm-devel@redhat.com, mpatocka@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v3 0/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 08 Jun 2019 08:53:13 +0000 (UTC)

On 08/06/2019 00:31, Jaskaran Khurana wrote:
> This patch set adds in-kernel pkcs7 signature checking for the roothash of
> the dm-verity hash tree.
> The verification is to support cases where the roothash is not secured by
> Trusted Boot, UEFI Secureboot or similar technologies.

...
>  drivers/md/Kconfig                |  23 ++++++
>  drivers/md/Makefile               |   2 +-
>  drivers/md/dm-verity-target.c     |  34 +++++++-
>  drivers/md/dm-verity-verify-sig.c | 132 ++++++++++++++++++++++++++++++
>  drivers/md/dm-verity-verify-sig.h |  30 +++++++

Please could you also modify Documentation/device-mapper/verity.txt and
describe the new table parameter?

It would be also nice to have a reference example how to configure it,
including how to create the signature file.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
