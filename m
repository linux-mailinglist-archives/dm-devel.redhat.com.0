Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1967E715B8
	for <lists+dm-devel@lfdr.de>; Tue, 23 Jul 2019 12:10:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DDCE83F51;
	Tue, 23 Jul 2019 10:10:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61DFA5B687;
	Tue, 23 Jul 2019 10:10:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1F4A18089C8;
	Tue, 23 Jul 2019 10:10:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6MNVCWR012403 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 19:31:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62BBA1017E3B; Mon, 22 Jul 2019 23:31:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00C011001B33;
	Mon, 22 Jul 2019 23:31:07 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 284F6307D848;
	Mon, 22 Jul 2019 23:30:54 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6MNTCdL104363; Mon, 22 Jul 2019 23:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=ZOinQjjkfv+8JYlsnjKtWVora/RDCEJ06rc6HsclIrg=;
	b=2y5dCRqNbyDeHDW0jO++e2I1na2Hzhb0IYMqCXazV73vVweZ4OOd8KSFXiqhSyPL/eem
	iXesaIm/WdS+KhEKF6eZ68fZEQTJoluEaEKrd7STPFx+IQffTHYYhJ543/d0UaYk+pmf
	MGTEO88kQsEaOzcNiR5TXyYkL1k4AwSs7+1do0/FOkeAymeiVs6+Im8IHK6XodjXW6Rr
	dM5lAOwvQUdebQviltw1VTHfLR2jpc1Z/PVcidXg9ld9vlb78FoECgHwBnwhfyGHfj3f
	eDEefmgyPeKhTIPH4C3fUOM934zI2/pGn0ZQuNNo018pzFMzr1uxRWmAxyh7uPY5VdJd
	5Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2tutctaeaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2019 23:30:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6MNRu3t087843; Mon, 22 Jul 2019 23:30:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 2tut9mkw89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2019 23:30:46 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6MNUjZ1000912;
	Mon, 22 Jul 2019 23:30:45 GMT
Received: from [192.168.1.14] (/180.165.87.209)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 22 Jul 2019 16:30:44 -0700
To: Hou Tao <houtao1@huawei.com>, linux-raid@vger.kernel.org,
	songliubraving@fb.com
References: <20190702132918.114818-1-houtao1@huawei.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <1ebcf2e8-f3ce-7417-4060-b9264a5a4e51@oracle.com>
Date: Tue, 23 Jul 2019 07:30:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190702132918.114818-1-houtao1@huawei.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9326
	signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1907220248
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9326
	signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1907220248
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 22 Jul 2019 23:31:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 22 Jul 2019 23:31:04 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'bob.liu@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.401  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <bob.liu@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 06:09:48 -0400
Cc: snitzer@redhat.com, neilb@suse.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/3] md: export internal stats through
	debugfs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 23 Jul 2019 10:10:14 +0000 (UTC)

T24gNy8yLzE5IDk6MjkgUE0sIEhvdSBUYW8gd3JvdGU6Cj4gSGksCj4gCj4gVGhlcmUgYXJlIHNv
IG1hbnkgaW8gY291bnRlcnMsIHN0YXRzIGFuZCBmbGFncyBpbiBtZCwgc28gSSB0aGluawo+IGV4
cG9ydCB0aGVzZSBpbmZvIHRvIHVzZXJzcGFjZSB3aWxsIGJlIGhlbHBmdWwgZm9yIG9ubGluZS1k
ZWJ1Z2dpbmcsCgpGb3Igb25saW5lLWRlYnVnZ2luZywgSSdkIHN1Z2dlc3QgeW91IGhhdmUgYSB0
cnkgZUJQRiB3aGljaCBjYW4gYmUgdmVyeSBoZWxwZnVsLgoKLUJvYgoKPiBlc3BlY2lhbGx5IHdo
ZW4gdGhlIHZtbGludXggZmlsZSBhbmQgdGhlIGNyYXNoIHV0aWxpdHkgYXJlIG5vdAo+IGF2YWls
YWJsZS4gQW5kIHRoZXNlIGluZm8gY2FuIGFsc28gYmUgdXRpbGl6ZWQgZHVyaW5nIGNvZGUKPiB1
bmRlcnN0YW5kaW5nLgo+IAo+IE1EIGhhcyBhbHJlYWR5IGV4cG9ydGVkIHNvbWUgc3RhdHMgdGhy
b3VnaCBzeXNmcyBmaWxlcyB1bmRlcgo+IC9zeXMvYmxvY2svbWRYL21kLCBidXQgdXNpbmcgc3lz
ZnMgZmlsZSB0byBleHBvcnQgbW9yZSBpbnRlcm5hbAo+IHN0YXRzIGFyZSBub3QgYSBnb29kIGNo
b2ljZSwgYmVjYXVzZSB3ZSBuZWVkIHRvIGNyZWF0ZSBhIHNpbmdsZQo+IHN5c2ZzIGZpbGUgZm9y
IGVhY2ggaW50ZXJuYWwgc3RhdCBhY2NvcmRpbmcgdG8gdGhlIHVzZSBjb252ZW50aW9uCj4gb2Yg
c3lzZnMgYW5kIHRoZXJlIGFyZSB0b28gbWFueSBpbnRlcm5hbCBzdGF0cy4gRnVydGhlciwgdGhl
Cj4gbmV3bHktY3JlYXRlZCBzeXNmcyBmaWxlcyB3b3VsZCBiZWNvbWUgQVBJcyBmb3IgdXNlcnNw
YWNlIHRvb2xzLAo+IGJ1dCB0aGF0IGlzIG5vdCB3ZSB3YW50ZWQsIGJlY2F1c2UgdGhlc2UgZmls
ZXMgYXJlIHJlbGF0ZWQgd2l0aAo+IGludGVybmFsIHN0YXRzIGFuZCBpbnRlcm5hbCBzdGF0cyBt
YXkgY2hhbmdlIGZyb20gdGltZSB0byB0aW1lLgo+IAo+IEFuZCBJIHRoaW5rIGRlYnVnZnMgaXMg
YSBiZXR0ZXIgY2hvaWNlLiBCZWNhdXNlIHdlIGNhbiBzaG93IG11bHRpcGxlCj4gcmVsYXRlZCBz
dGF0cyBpbiBhIGRlYnVnZnMgZmlsZSwgYW5kIHRoZSBkZWJ1Z2ZzIGZpbGUgd2lsbCBuZXZlciBi
ZQo+IHVzZWQgYXMgYW4gdXNlcnNwYWNlIEFQSS4KPiAKPiBUd28gZGVidWdmcyBmaWxlcyBhcmUg
Y3JlYXRlZCB0byBleHBvc2UgdGhlc2UgaW50ZXJuYWwgc3RhdHM6Cj4gKiBpb3N0YXQ6IGlvIGNv
dW50ZXJzIGFuZCBpbyByZWxhdGVkIHN0YXRzIChlLmcuLCBtZGRldi0+YWN0aXZlX2lvLAo+IAly
MWNvbmYtPm5yX3BlbmRpbmcsIG9yIHIxY29uZmktPnJldHJ5X2xpc3QpCj4gKiBzdGF0OiBub3Jt
YWwgc3RhdHMvZmxhZ3MgKGUuZy4sIG1kZGV2LT5yZWNvdmVyeSwgY29uZi0+YXJyYXlfZnJvemVu
KQo+IAo+IEJlY2F1c2UgaW50ZXJuYWwgc3RhdHMgYXJlIHNwcmVhZGVkIGFsbCBvdmVyIG1kLWNv
cmUgYW5kIG1kLXBlcnNvbmFsaXR5LAo+IHNvIGJvdGggbWQtY29yZSBhbmQgbWQtcGVyc29uYWxp
dHkgd2lsbCBjcmVhdGUgdGhlc2UgdHdvIGRlYnVnZnMgZmlsZXMKPiB1bmRlciBkaWZmZXJlbnQg
ZGVidWdmcyBkaXJlY3RvcnkuCj4gCj4gUGF0Y2ggMSBmYWN0b3JzIG91dCB0aGUgZGVidWdmcyBm
aWxlcyBjcmVhdGlvbiByb3V0aW5lIGZvciBtZC1jb3JlIGFuZAo+IG1kLXBlcnNvbmFsaXR5LCBw
YXRjaCAyIGNyZWF0ZXMgdHdvIGRlYnVnZnMgZmlsZXM6IGlvc3RhdCAmIHN0YXQgdW5kZXIKPiAv
c3lzL2tlcm5lbC9kZWJ1Zy9ibG9jay9tZFggZm9yIG1kLWNvcmUsIGFuZCBwYXRjaCAzIGNyZWF0
ZXMgdHdvIGRlYnVnZnMKPiBmaWxlczogaW9zdGF0ICYgc3RhdCB1bmRlciAvc3lzL2tlcm5lbC9k
ZWJ1Zy9ibG9jay9tZFgvcmFpZDEgZm9yIG1kLXJhaWQxLgo+IAo+IFRoZSBmb2xsb3dpbmcgbGlu
ZXMgc2hvdyB0aGUgaGllcmFyY2h5IGFuZCB0aGUgY29udGVudCBvZiB0aGVzZSBkZWJ1Z2ZzCj4g
ZmlsZXMgZm9yIGEgUkFJRDEgZGV2aWNlOgo+IAo+ICQgcHdkCj4gL3N5cy9rZXJuZWwvZGVidWcv
YmxvY2svbWQwCj4gJCB0cmVlCj4gLgo+IOKUnOKUgOKUgCBpb3N0YXQKPiDilJzilIDilIAgcmFp
ZDEKPiDilILCoMKgIOKUnOKUgOKUgCBpb3N0YXQKPiDilILCoMKgIOKUlOKUgOKUgCBzdGF0Cj4g
4pSU4pSA4pSAIHN0YXQKPiAKPiAkIGNhdCBpb3N0YXQKPiBhY3RpdmVfaW8gMAo+IHNiX3dhaXQg
MCBwZW5kaW5nX3dyaXRlcyAwCj4gcmVjb3ZlcnlfYWN0aXZlIDAKPiBiaXRtYXAgcGVuZGluZ193
cml0ZXMgMAo+IAo+ICQgY2F0IHN0YXQKPiBmbGFncyAweDIwCj4gc2JfZmxhZ3MgMHgwCj4gcmVj
b3ZlcnkgMHgwCj4gCj4gJCBjYXQgcmFpZDEvaW9zdGF0Cj4gcmV0cnlfbGlzdCBhY3RpdmUgMAo+
IGJpb19lbmRfaW9fbGlzdCBhY3RpdmUgMAo+IHBlbmRpbmdfYmlvX2xpc3QgYWN0aXZlIDAgY250
IDAKPiBzeW5jX3BlbmRpbmcgMAo+IG5yX3BlbmRpbmcgMAo+IG5yX3dhaXRpbmcgMAo+IG5yX3F1
ZXVlZCAwCj4gYmFycmllciAwCj4gCj4gJCBjYXQgcmFpZDEvc3RhdAo+IGFycmF5X2Zyb3plbiAw
Cj4gCj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhlIGRpdmlzaW9uIG9mIGludGVybmFsIHN0YXRz
IGlzIGFwcHJvcHJpYXRlIGFuZAo+IHdoZXRoZXIgdGhlIGludGVybmFsIHN0YXRzIGluIGRlYnVn
ZnMgZmlsZXMgYXJlIHN1ZmZpY2llbnQsIHNvIHF1ZXN0aW9ucwo+IGFuZCBjb21tZW50cyBhcmUg
d2VjbG9tZS4KPiAKPiBSZWdhcmRzLAo+IFRhbwo+IAo+IEhvdSBUYW8gKDMpOgo+ICAgbWQtZGVi
dWdmczogYWRkIG1kX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCkKPiAgIG1kOiBleHBvcnQgaW5mbGln
aHQgaW8gY291bnRlcnMgYW5kIGludGVybmFsIHN0YXRzIGluIGRlYnVnZnMKPiAgIHJhaWQxOiBl
eHBvcnQgaW5mbGlnaHQgaW8gY291bnRlcnMgYW5kIGludGVybmFsIHN0YXRzIGluIGRlYnVnZnMK
PiAKPiAgZHJpdmVycy9tZC9NYWtlZmlsZSAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21kL21kLWRl
YnVnZnMuYyB8IDM1ICsrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL21kL21kLWRlYnVnZnMu
aCB8IDE2ICsrKysrKysrKwo+ICBkcml2ZXJzL21kL21kLmMgICAgICAgICB8IDY1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9tZC9tZC5oICAgICAgICAgfCAg
MSArCj4gIGRyaXZlcnMvbWQvcmFpZDEuYyAgICAgIHwgNzggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9tZC9yYWlkMS5oICAgICAgfCAgMSArCj4g
IDcgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWQvbWQtZGVidWdmcy5jCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21kL21kLWRlYnVnZnMuaAo+IAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0
CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RtLWRldmVs
