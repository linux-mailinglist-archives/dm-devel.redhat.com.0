Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 08DF92AF853
	for <lists+dm-devel@lfdr.de>; Wed, 11 Nov 2020 19:41:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-rCaZ6aU2NG-SHm7w8WguiQ-1; Wed, 11 Nov 2020 13:41:17 -0500
X-MC-Unique: rCaZ6aU2NG-SHm7w8WguiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06DB464160;
	Wed, 11 Nov 2020 18:41:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6FBB6EF68;
	Wed, 11 Nov 2020 18:41:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9479F44A7C;
	Wed, 11 Nov 2020 18:41:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ABBjleI016406 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 06:45:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6B00A2014E17; Wed, 11 Nov 2020 11:45:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6687020110C9
	for <dm-devel@redhat.com>; Wed, 11 Nov 2020 11:45:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EE17102F1E1
	for <dm-devel@redhat.com>; Wed, 11 Nov 2020 11:45:45 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-437-aUj_6PIpOZe9uiC1e1arEg-1; Wed, 11 Nov 2020 06:45:42 -0500
X-MC-Unique: aUj_6PIpOZe9uiC1e1arEg-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <colin.king@canonical.com>)
	id 1kcoZG-0006zC-DA; Wed, 11 Nov 2020 11:45:38 +0000
From: Colin Ian King <colin.king@canonical.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <c5c17cba-3bf2-ce07-ed7f-6e5b5e71427c@canonical.com>
Date: Wed, 11 Nov 2020 11:45:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 11 Nov 2020 13:39:49 -0500
Cc: linux-raid@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm: rename multipath path selector source files to
 have "dm-ps" prefix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Static analysis on linux-next has detected an initialized variable issue
with the following recent commit:

commit 28784347451fdbf4671ba97018f816041ba2306a
Author: Mike Snitzer <snitzer@redhat.com>
Date:   Tue Nov 10 13:41:53 2020 -0500

    dm: rename multipath path selector source files to have "dm-ps" prefix

The analysis is as follows:

 43
static int ioa_add_path(struct path_selector *ps, struct dm_path *path,
 44                        int argc, char **argv, char **error)
 45 {
 46        struct selector *s = ps->context;
 47        struct path_info *pi = NULL;
   1. var_decl: Declaring variable cpu without initializer.

 48        unsigned int cpu;
 49        int ret;
 50
   2. Condition argc != 1, taking false branch.

 51        if (argc != 1) {
 52                *error = "io-affinity ps: invalid number of arguments";
 53                return -EINVAL;
 54        }
 55

   Uninitialized scalar variable (UNINIT)
   3. uninit_use_in_call: Using uninitialized value cpu when calling
__cpu_to_node.

 56        pi = kzalloc_node(sizeof(*pi), GFP_KERNEL, cpu_to_node(cpu));
 57        if (!pi) {
 58                *error = "io-affinity ps: Error allocating path context";
 59                return -ENOMEM;
 60        }

Colin

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

