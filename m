Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A6870FC47
	for <lists+dm-devel@lfdr.de>; Wed, 24 May 2023 19:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684948242;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pM3Jk/gkjYYOrhGfRjJ17BsW9SQSc44meaBg2voxgfI=;
	b=EvwPHBBOdwJpc5LoihS+y/GaCmLePfNQJetr6DzKK2xPM2WPkwiwGxQvhgObflJr/Ohd25
	YQnwyu/ft6piJf0XmMX2CVYQP1SgFf5CXiczabobCmFP1D4rWdZ6u8/7x4+EqnPRX3bxo1
	DotRn6WbqQznsRiY/PUouEbDEecTQAQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-hJSrSwuCPvOJ_RLDQTlFvQ-1; Wed, 24 May 2023 13:10:39 -0400
X-MC-Unique: hJSrSwuCPvOJ_RLDQTlFvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A48C2101A53A;
	Wed, 24 May 2023 17:10:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7371121315;
	Wed, 24 May 2023 17:10:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B1D719465BC;
	Wed, 24 May 2023 17:10:27 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58D1719465A0
 for <dm-devel@listman.corp.redhat.com>; Wed, 24 May 2023 17:10:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 473C72029F6E; Wed, 24 May 2023 17:10:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FAF02029F6D
 for <dm-devel@redhat.com>; Wed, 24 May 2023 17:10:26 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13598811760
 for <dm-devel@redhat.com>; Wed, 24 May 2023 17:10:26 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-1vd1V__aPRieLBaAR7mkow-3; Wed, 24 May 2023 13:10:23 -0400
X-MC-Unique: 1vd1V__aPRieLBaAR7mkow-3
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="338206723"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="338206723"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="704427349"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="704427349"
Received: from chang-linux-3.sc.intel.com ([172.25.66.173])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2023 10:09:52 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dm-devel@redhat.com
Date: Wed, 24 May 2023 09:57:10 -0700
Message-Id: <20230524165717.14062-6-chang.seok.bae@intel.com>
In-Reply-To: <20230524165717.14062-1-chang.seok.bae@intel.com>
References: <20230410225936.8940-1-chang.seok.bae@intel.com>
 <20230524165717.14062-1-chang.seok.bae@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH v7 05/12] x86/msr-index: Add MSRs for Key Locker
 wrapping key
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: x86@kernel.org, herbert@gondor.apana.org.au, ardb@kernel.org,
 chang.seok.bae@intel.com, dave.hansen@linux.intel.com,
 dan.j.williams@intel.com, mingo@kernel.org, ebiggers@kernel.org,
 lalithambika.krishnakumar@intel.com, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, charishma1.gairuboyina@intel.com,
 luto@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, bernie.keany@intel.com,
 tglx@linutronix.de, nhuck@google.com, gmazyland@gmail.com, elliott@hpe.com
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The CPU state that contains the wrapping key is in the same power
domain as the cache. So any sleep state that would invalidate the
cache (like S3) also invalidates the state of the wrapping key.

But, since the state is inaccessible to software, it needs a special
mechanism to save and restore the key during deep sleep.

A set of new MSRs are provided as an abstract interface to save and
restore the wrapping key, and to check the key status. The wrapping
key is saved in a platform-scoped state of non-volatile media. The
backup itself and its path from the CPU are encrypted and integrity
protected.

Define those MSRs to be used to save and restore the key for S3/4
sleep states.

But the backup storage's non-volatility is not architecturally
guaranteed across off-states, such as S5 and G3. Then, the kernel may
generate a new key on the next boot.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
---
Changes from v6:
* Tweak the changelog -- put the last for those about other sleep
  states

Changes from RFC v2:
* Update the changelog. (Dan Williams)
* Rename the MSRs. (Dan Williams)
---
 arch/x86/include/asm/msr-index.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 3aedae61af4f..cd8555c0f3c2 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1117,4 +1117,10 @@
 						* a #GP
 						*/
 
+/* MSRs for managing a CPU-internal wrapping key for Key Locker. */
+#define MSR_IA32_IWKEY_COPY_STATUS		0x00000990
+#define MSR_IA32_IWKEY_BACKUP_STATUS		0x00000991
+#define MSR_IA32_BACKUP_IWKEY_TO_PLATFORM	0x00000d91
+#define MSR_IA32_COPY_IWKEY_TO_LOCAL		0x00000d92
+
 #endif /* _ASM_X86_MSR_INDEX_H */
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

