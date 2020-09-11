Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F097E2685C6
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:25:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-bm4sw1DvOdiurXocCzfMdQ-1; Mon, 14 Sep 2020 03:24:26 -0400
X-MC-Unique: bm4sw1DvOdiurXocCzfMdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2972801ADA;
	Mon, 14 Sep 2020 07:24:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BACCA7B7B9;
	Mon, 14 Sep 2020 07:24:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76B621832FDC;
	Mon, 14 Sep 2020 07:24:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BGMr3k016389 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 12:22:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B509202450E; Fri, 11 Sep 2020 16:22:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23E67201EF59
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:22:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C654A101A568
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:22:50 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-211-UJ-KKB-TM1SMTnSJTk4TRg-1;
	Fri, 11 Sep 2020 12:22:46 -0400
X-MC-Unique: UJ-KKB-TM1SMTnSJTk4TRg-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 953AD20716FC;
	Fri, 11 Sep 2020 09:22:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 953AD20716FC
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-3-tusharsu@linux.microsoft.com>
	<e76bdb18c6045702156441470e50380445e6e218.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <b4cc6ec3-a58b-df2b-2de9-864775ae2a5f@linux.microsoft.com>
Date: Fri, 11 Sep 2020 09:22:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e76bdb18c6045702156441470e50380445e6e218.camel@linux.ibm.com>
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
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 2/6] IMA: change
 process_buffer_measurement return type from void to int
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2020-08-31 4:36 a.m., Mimi Zohar wrote:
> On Thu, 2020-08-27 at 18:57 -0700, Tushar Sugandhi wrote:
>> process_buffer_measurement() does not return the result of the operation.
>> Therefore, the consumers of this function cannot act on it, if needed.
>>
>> Update return type of process_buffer_measurement() from void to int.
> 
> Failure to measure may be audited, but should never fail.  This is one
> of the main differences between secure and trusted boot concepts.
> Notice in process_measurement() that -EACCES is only returned for
> appraisal.
> 
> Returning a failure from process_buffer_measurement() in itself isn't a
> problem, as long as the failure isn't returned to the LSM/IMA hook.
> However,  just as the callers of  process_measurement() originally
> processed the result, that processing was moved into
> process_measurement() [1].
> 
> Mimi
> 
> [1] 750943a30714 ima: remove enforce checking duplication
> 
I can ignore the result of process_buffer_measurement() in
ima_measure_critical_data(), and make  ima_measure_critical_data()
return type "void".

But currently ima_measure_critical_data() is the only place where the
results of p_b_m() are being used.
So I might as well just revert back the return type of p_b_m() to
the original "void".


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

