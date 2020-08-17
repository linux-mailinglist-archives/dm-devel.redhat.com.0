Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 03D6F24872D
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467--Bs4Mn78Oi-SwCot9ToNfg-1; Tue, 18 Aug 2020 10:17:48 -0400
X-MC-Unique: -Bs4Mn78Oi-SwCot9ToNfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64E16807338;
	Tue, 18 Aug 2020 14:17:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 428475C64D;
	Tue, 18 Aug 2020 14:17:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE437181A07C;
	Tue, 18 Aug 2020 14:17:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HMjPdh021802 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 18:45:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C110F202278D; Mon, 17 Aug 2020 22:45:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B26F12022789
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 22:45:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5EB8801223
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 22:45:22 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-309-eZmYNN_lP3OlnstGNkePvA-1;
	Mon, 17 Aug 2020 18:45:20 -0400
X-MC-Unique: eZmYNN_lP3OlnstGNkePvA-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 592E620B4908;
	Mon, 17 Aug 2020 15:45:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 592E620B4908
To: Mimi Zohar <zohar@linux.ibm.com>, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200816210250.11506-1-tusharsu@linux.microsoft.com>
	<5f12cc89c535ccfc6c3d63efa2bf716a1fdd966d.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <f252a595-7b6a-9e20-bf08-97f102c41c01@linux.microsoft.com>
Date: Mon, 17 Aug 2020 15:45:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f12cc89c535ccfc6c3d63efa2bf716a1fdd966d.camel@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: sashal@kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 0/2] dm-devel:dm-crypt: infrastructure for
 measurement of DM target data using IMA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 2020-08-17 2:46 p.m., Mimi Zohar wrote:
> On Sun, 2020-08-16 at 14:02 -0700, Tushar Sugandhi wrote:
>> There are several device-mapper targets which contribute to verify
>> the integrity of the mapped devices e.g. dm-integrity, dm-verity,
>> dm-crypt etc.
>>
>> But they do not use the capabilities provided by kernel integrity
>> subsystem (IMA). For instance, the IMA capability that measures several
>> in-memory constructs and files to detect if they have been accidentally
>> or maliciously altered, both remotely and locally. IMA also has the
>> capability to include these measurements in the IMA measurement list and
>> use them to extend a TPM PCR so that it can be quoted.
> 
> "both remotely" refers to measurement and attestation, while "locally"
> refers to integrity enforcement, based on hashes or signatures.  Is
> this patch set adding both IMA-measurement and IMA-appraisal?
> 
> Mimi
> 
Thanks Mimi for looking at this patch set.

I added both "remotely" and "locally" in the description, so that
people less familiar with IMA would get a general overview of whats
possible with IMA.

In this patch set we are only adding support for measurement and
attestation. In the next iteration, I will remove the references to
"local" detection.
~Tushar
<snip>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

