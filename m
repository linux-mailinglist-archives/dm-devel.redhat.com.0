Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F080F25897E
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:44:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-pRHNGSMqPFKZ7myul_JHow-1; Tue, 01 Sep 2020 03:44:13 -0400
X-MC-Unique: pRHNGSMqPFKZ7myul_JHow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F18FD100746D;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 932237DA44;
	Tue,  1 Sep 2020 07:44:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19E59181A71E;
	Tue,  1 Sep 2020 07:43:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07V9u12u032430 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 05:56:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 770E3110F73E; Mon, 31 Aug 2020 09:56:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70325110F73D
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 09:55:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3927280029D
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 09:55:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-79-2oBS9zqyNGGdyfpxGyo_tg-1;
	Mon, 31 Aug 2020 05:55:51 -0400
X-MC-Unique: 2oBS9zqyNGGdyfpxGyo_tg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 98776ABF4;
	Mon, 31 Aug 2020 09:56:24 +0000 (UTC)
Message-ID: <cb97dfa97281bf9fe6738ffbf6abb20b5e2991ae.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Date: Mon, 31 Aug 2020 11:55:48 +0200
In-Reply-To: <8e24c49b-6f56-e7ea-7f2a-e7bd9d266e23@huawei.com>
References: <dc4f5730-157f-8a27-247c-628f38bb6cb5@huawei.com>
	<8e24c49b-6f56-e7ea-7f2a-e7bd9d266e23@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: lixiaokeng <lixiaokeng@huawei.com>, yanxiaodan@huawei.com,
	linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH V3 2/5] multipathd: use daemon_status_msg to
 construct sd notify msg in do_sd_notify func
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-Mb/0r6fdD7qL3QWJTAR8"

--=-Mb/0r6fdD7qL3QWJTAR8
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit

Hello Zhiqiang,

On Sat, 2020-08-29 at 11:03 +0800, Zhiqiang Liu wrote:
> sd_notify_status() is very similar with daemon_status(), except
> DAEMON_IDLE and DAEMON_RUNNING state. As suggested by Martin,
> we can create the sd notification string in a dynamic buffer,
> and treat DAEMON_IDLE and DAEMON_RUNNING cases first. Then,
> we can use daemon_status_msg[state] for other cases.
> 
> V2->V3:
> - set MSG_SIZE to 32 and use safe_sprintf as suggested by Martin.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/main.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)

Thanks again. I'd like to modify the patch slightly as attached. 
I'm sorry that I didn't mention these minor issues in my previous
reviews. I'm sending you the fixup patch in order to short-circuit 
the procedure a bit and save both of us some work.

Would this be ok for you?
If yes, please resubmit this as v4.

Regards,
Martin


--=-Mb/0r6fdD7qL3QWJTAR8
Content-Disposition: attachment;
	filename*0=0001-fixup-multipathd-use-daemon_status_msg-to-construct-.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-fixup-multipathd-use-daemon_status_msg-to-construct-.patch"; 
	charset="ISO-8859-15"
Content-Transfer-Encoding: base64

RnJvbSA3MzkxNWZiMzJiMmIwZDIzM2VlOTA4YTQ3ODk2MTNjMDNjMjcyODVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4KRGF0ZTog
TW9uLCAzMSBBdWcgMjAyMCAxMTo0Mzo1NiArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGZpeHVwISBt
dWx0aXBhdGhkOiB1c2UgZGFlbW9uX3N0YXR1c19tc2cgdG8gY29uc3RydWN0IHNkCiBub3RpZnkg
bXNnIGluIGRvX3NkX25vdGlmeSBmdW5jCgogLSBubyBuZWVkIHRvIGluaXRpYWxpemUgbXNnLCBp
dCdzIGFsd2F5cyBzZXQKIC0gbXNnIGNvdWxkIGJlIE5VTEwsIGF0IGxlYXN0IGluIHRoZW9yeSwg
c28gY2hlY2sgcmV0dXJuIHZhbHVlIGJlZm9yZSBwYXNzaW5nCiBpdCB0byBzbnByaW50ZigpCiAt
IGF2b2lkICJwcmVmaXgiIHZhcmlhYmxlOyByYXRoZXIgcHV0IHRoZSBwcmVmaXggaW4gZm9ybWF0
IHN0cmluZwotLS0KIG11bHRpcGF0aGQvbWFpbi5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tdWx0aXBhdGhk
L21haW4uYyBiL211bHRpcGF0aGQvbWFpbi5jCmluZGV4IDVkZjAwNGEuLmY3MjI5YTcgMTAwNjQ0
Ci0tLSBhL211bHRpcGF0aGQvbWFpbi5jCisrKyBiL211bHRpcGF0aGQvbWFpbi5jCkBAIC0xODMs
OCArMTgzLDcgQEAgc3RhdGljIHZvaWQgZG9fc2Rfbm90aWZ5KGVudW0gZGFlbW9uX3N0YXR1cyBv
bGRfc3RhdGUsCiAJCQkgZW51bSBkYWVtb25fc3RhdHVzIG5ld19zdGF0ZSkKIHsKIAljaGFyIG5v
dGlmeV9tc2dbTVNHX1NJWkVdOwotCWNvbnN0IGNoYXIgcHJlZml4W10gPSAiU1RBVFVTPSI7Ci0J
Y29uc3QgY2hhciAqbXNnID0gTlVMTDsKKwljb25zdCBjaGFyICptc2c7CiAJLyoKIAkgKiBDaGVj
a2VybG9vcCBzd2l0Y2hlcyBiYWNrIGFuZCBmb3J0aCBiZXR3ZWVuIGlkbGUgYW5kIHJ1bm5pbmcg
c3RhdGUuCiAJICogTm8gbmVlZCB0byB0ZWxsIHN5c3RlbWQgZWFjaCB0aW1lLgpAQCAtMTk5LDcg
KzE5OCw3IEBAIHN0YXRpYyB2b2lkIGRvX3NkX25vdGlmeShlbnVtIGRhZW1vbl9zdGF0dXMgb2xk
X3N0YXRlLAogCWVsc2UKIAkJbXNnID0gZGFlbW9uX3N0YXR1c19tc2dbbmV3X3N0YXRlXTsKIAot
CWlmICghc2FmZV9zcHJpbnRmKG5vdGlmeV9tc2csICIlcyVzIiwgcHJlZml4LCBtc2cpKQorCWlm
IChtc2cgJiYgIXNhZmVfc3ByaW50Zihub3RpZnlfbXNnLCAiU1RBVFVTPSVzIiwgbXNnKSkKIAkJ
c2Rfbm90aWZ5KDAsIG5vdGlmeV9tc2cpOwogfQogI2VuZGlmCi0tIAoyLjI4LjAKCg==
--=-Mb/0r6fdD7qL3QWJTAR8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--=-Mb/0r6fdD7qL3QWJTAR8--

