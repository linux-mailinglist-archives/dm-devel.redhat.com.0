Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD6A5187
	for <lists+dm-devel@lfdr.de>; Mon,  2 Sep 2019 10:26:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAC5518C427D;
	Mon,  2 Sep 2019 08:26:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80A2B5D9DC;
	Mon,  2 Sep 2019 08:26:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EE8A24F2F;
	Mon,  2 Sep 2019 08:26:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8214qF3007438 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 1 Sep 2019 21:04:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 948BE19D7A; Mon,  2 Sep 2019 01:04:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3EA19C5B
	for <dm-devel@redhat.com>; Mon,  2 Sep 2019 01:04:50 +0000 (UTC)
Received: from mail.gusev.co (de1.gusev.co [84.16.227.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D8FF307D90D
	for <dm-devel@redhat.com>; Mon,  2 Sep 2019 01:04:48 +0000 (UTC)
Received: from [10.0.0.5] (78-57-160-222.static.zebra.lt [78.57.160.222])
	by mail.gusev.co (Postfix) with ESMTPSA id D73D423DDC;
	Mon,  2 Sep 2019 04:04:46 +0300 (EEST)
From: Dmitrij Gusev <dmitrij@gusev.co>
To: dm-devel@redhat.com
References: <20190829081514.29660-1-yuyufen@huawei.com>
	<877e6vf45p.fsf@notabene.neil.brown.name>
	<07ffeca5-6b69-0602-0981-2221cfb682af@huawei.com>
Message-ID: <8a1c4146-fdc5-138d-af2d-a77b606b59e2@gusev.co>
Date: Mon, 2 Sep 2019 04:04:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <07ffeca5-6b69-0602-0981-2221cfb682af@huawei.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 02 Sep 2019 01:04:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 02 Sep 2019 01:04:49 +0000 (UTC) for IP:'84.16.227.28'
	DOMAIN:'de1.gusev.co' HELO:'mail.gusev.co'
	FROM:'dmitrij@gusev.co' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 84.16.227.28 de1.gusev.co 84.16.227.28
	de1.gusev.co <dmitrij@gusev.co>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Sep 2019 04:26:12 -0400
Subject: [dm-devel] Kernel error at a LVM snapshot creation
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Mon, 02 Sep 2019 08:26:40 +0000 (UTC)

SGVsbG8uCgpJIGdldCBhIGtlcm5lbCBlcnJvciBldmVyeSB0aW1lIEkgY3JlYXRlIExWTSBzbmFw
c2hvdCAtIGF0IHRoZSBjcmVhdGlvbiAKYW5kIGF0IGJvb3QgdGltZSwgdGhvdWdoIHRoZSBzbmFw
c2hvdCBpdHNlbGYgaXMgd29ya2luZyBwcm9wZXJseS4KCkxpbnV4IG5leHVzIDQuMTkuNjkgIzIg
U01QIFRodSBBdWcgMjkgMTY6MzM6MzUgQ0RUIDIwMTkgeDg2XzY0IEludGVsKFIpIApYZW9uKFIp
IEUtMjE3NEcgQ1BVIEAgMy44MEdIeiBHZW51aW5lSW50ZWwgR05VL0xpbnV4CgpBdCBib290IGxv
ZzoKClvCoMKgIDE3LjE2MDQwMl0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
ClvCoMKgIDE3LjE2MDkwMF0gZ2VuZXJpY19tYWtlX3JlcXVlc3Q6IFRyeWluZyB0byB3cml0ZSB0
byByZWFkLW9ubHkgCmJsb2NrLWRldmljZSBkbS00IChwYXJ0bm8gMCkKW8KgwqAgMTcuMTYxNDI0
XSBXQVJOSU5HOiBDUFU6IDMgUElEOiA5NDEgYXQgYmxvY2svYmxrLWNvcmUuYzoyMTc2IApnZW5l
cmljX21ha2VfcmVxdWVzdF9jaGVja3MrMHgyOGQvMHg2YTAKW8KgwqAgMTcuMTYxOTM1XSBNb2R1
bGVzIGxpbmtlZCBpbjogZnVzZSBoaWRfZ2VuZXJpYyB1c2JoaWQgaGlkIGkyY19kZXYgCm1laV93
ZHQgZWVlcGNfd21pIGFzdXNfd21pIGV2ZGV2IHNwYXJzZV9rZXltYXAgcmZraWxsIHdtaV9ibW9m
IApzbmRfaGRhX2NvZGVjX2hkbWkgY29yZXRlbXAgc25kX2hkYV9jb2RlY19yZWFsdGVrIGludGVs
X3JhcGwgCnNuZF9oZGFfY29kZWNfZ2VuZXJpYyB4ODZfcGtnX3RlbXBfdGhlcm1hbCBpbnRlbF9w
b3dlcmNsYW1wIGt2bV9pbnRlbCAKY3JjdDEwZGlmX3BjbG11bCBjcmMzMl9wY2xtdWwgaTkxNSBj
cmMzMmNfaW50ZWwgZ2hhc2hfY2xtdWxuaV9pbnRlbCAKaW50ZWxfY3N0YXRlIHNuZF9oZGFfaW50
ZWwgc25kX2hkYV9jb2RlYyBrdm1ndCB2ZmlvX21kZXYgaW50ZWxfcmFwbF9wZXJmIAptZGV2IHZm
aW9faW9tbXVfdHlwZTEgdmZpbyBrdm0gc25kX2hkYV9jb3JlIHNuZF9od2RlcCBpZ2Igc25kX3Bj
bSAKc25kX3RpbWVyIHNuZCBlMTAwMGUgc291bmRjb3JlIGlycWJ5cGFzcyBjZWMgcmNfY29yZSBo
d21vbiBkY2EgaTJjX2k4MDEgCmRybV9rbXNfaGVscGVyIGRybSBpbnRlbF9ndHQgYWdwZ2FydCB0
aGVybWFsIGZhbiBpMmNfYWxnb19iaXQgCmZiX3N5c19mb3BzIHN5c2NvcHlhcmVhIHN5c2ZpbGxy
ZWN0IHN5c2ltZ2JsdCBpMmNfY29yZSB2aWRlbyBtZWlfbWUgbWVpIAp4aGNpX3BjaSB4aGNpX2hj
ZCBidXR0b24gcGNjX2NwdWZyZXEgd21pIGFjcGlfcGFkIGFjcGlfdGFkIGxvb3AgCmRtX3NuYXBz
aG90IGRtX2J1ZmlvIGV4dDQgbWJjYWNoZSBqYmQyClvCoMKgIDE3LjE2NTk1NV0gQ1BVOiAzIFBJ
RDogOTQxIENvbW06IGt3b3JrZXIvMzozIE5vdCB0YWludGVkIDQuMTkuNjkgIzIKW8KgwqAgMTcu
MTY2NDY0XSBIYXJkd2FyZSBuYW1lOiBBU1VTVGVLIENPTVBVVEVSIElOQy4gU3lzdGVtIFByb2R1
Y3QgCk5hbWUvV1MgQzI0NiBQUk8sIEJJT1MgMTAwMyAwNi8wNC8yMDE5ClvCoMKgIDE3LjE2Njk1
Ml0gV29ya3F1ZXVlOiBrY29weWQgZG9fd29yawpbwqDCoCAxNy4xNjc0NjddIFJJUDogMDAxMDpn
ZW5lcmljX21ha2VfcmVxdWVzdF9jaGVja3MrMHgyOGQvMHg2YTAKW8KgwqAgMTcuMTY3OTUyXSBD
b2RlOiA1YyAwMyAwMCAwMCA0OCA4OSBlZiA0OCA4ZCA3NCAyNCAwOCBjNiAwNSAxMSA0NyBmMyAK
MDAgMDEgZTggNTUgNjAgMDEgMDAgNDggYzcgYzcgZDAgNWQgMDggYmQgNDggODkgYzYgNDQgODkg
ZTIgZTggMjIgY2QgY2MgCmZmIDwwZj4gMGIgNGMgOGIgNjUgMDggOGIgNDUgMzAgYzEgZTggMDkg
NDkgOGIgNzQgMjQgNTAgODUgYzAgMGYgODQgNWYKW8KgwqAgMTcuMTY5MDIwXSBSU1A6IDAwMTg6
ZmZmZjlkZjNjNDAwZmFmOCBFRkxBR1M6IDAwMDEwMjgyClvCoMKgIDE3LjE2OTUzM10gUkFYOiAw
MDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZjkyN2MwNTM1MDk4OCBSQ1g6IAowMDAwMDAwMDAwMDAw
MzExClvCoMKgIDE3LjE3MDA0OV0gUkRYOiAwMDAwMDAwMDAwMDAwMDAxIFJTSTogMDAwMDAwMDAw
MDAwMDA4MiBSREk6IAowMDAwMDAwMDAwMDAwMjQ2ClvCoMKgIDE3LjE3MDU2Ml0gUkJQOiBmZmZm
OTI3YzA2YTY0OTAwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IAowMDAwMDAwMDAwMDAwMzEx
ClvCoMKgIDE3LjE3MTEwNl0gUjEwOiAwMDAwMDAwMDAwYWFhYWFhIFIxMTogMDAwMDAwMDAwMDAw
MDAwMCBSMTI6IAowMDAwMDAwMDAwMDAwMDAwClvCoMKgIDE3LjE3MTYxNl0gUjEzOiAwMDAwMDAw
MDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMTAwMCBSMTU6IApmZmZmOTI3YzA1NDcyYjgwClvC
oMKgIDE3LjE3MjEzMF0gRlM6wqAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOTI3YzBi
YjgwMDAwKDAwMDApIAprbmxHUzowMDAwMDAwMDAwMDAwMDAwClvCoMKgIDE3LjE3MjY0Nl0gQ1M6
wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKW8KgwqAgMTcu
MTczMTkxXSBDUjI6IDAwMDA3ZjQwYTA1ZjlmZjAgQ1IzOiAwMDAwMDAwMTVhMjBhMDA0IENSNDog
CjAwMDAwMDAwMDAzNjA2ZTAKW8KgwqAgMTcuMTczNzExXSBEUjA6IDAwMDAwMDAwMDAwMDAwMDAg
RFIxOiAwMDAwMDAwMDAwMDAwMDAwIERSMjogCjAwMDAwMDAwMDAwMDAwMDAKW8KgwqAgMTcuMTc0
MjM4XSBEUjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwIERSNzogCjAw
MDAwMDAwMDAwMDA0MDAKW8KgwqAgMTcuMTc0NzUyXSBDYWxsIFRyYWNlOgpbwqDCoCAxNy4xNzUy
NzldwqAgPyBrbWVtX2NhY2hlX2FsbG9jKzB4MzcvMHgxYzAKW8KgwqAgMTcuMTc1NzcxXcKgIGdl
bmVyaWNfbWFrZV9yZXF1ZXN0KzB4NWIvMHg0MDAKW8KgwqAgMTcuMTc2MjQ3XcKgIHN1Ym1pdF9i
aW8rMHg0My8weDEzMApbwqDCoCAxNy4xNzY3MjZdwqAgPyBiaW9fYWRkX3BhZ2UrMHg0OC8weDYw
ClvCoMKgIDE3LjE3NzE5NV3CoCBkaXNwYXRjaF9pbysweDFjOC8weDQ2MApbwqDCoCAxNy4xNzc2
ODldwqAgPyBkbV9oYXNoX3JlbW92ZV9hbGwuY29sZCsweDIxLzB4MjEKW8KgwqAgMTcuMTc4MTY4
XcKgID8gbGlzdF9nZXRfcGFnZSsweDMwLzB4MzAKW8KgwqAgMTcuMTc4NjI0XcKgID8gZG1fa2Nv
cHlkX2RvX2NhbGxiYWNrKzB4NDAvMHg0MApbwqDCoCAxNy4xNzkxMDJdwqAgZG1faW8rMHgxMWMv
MHgyMTAKW8KgwqAgMTcuMTc5NTQ1XcKgID8gZG1faGFzaF9yZW1vdmVfYWxsLmNvbGQrMHgyMS8w
eDIxClvCoMKgIDE3LjE3OTk5MF3CoCA/IGxpc3RfZ2V0X3BhZ2UrMHgzMC8weDMwClvCoMKgIDE3
LjE4MDQyOV3CoCBydW5faW9fam9iKzB4ZDQvMHgxYzAKW8KgwqAgMTcuMTgwODYzXcKgID8gZG1f
a2NvcHlkX2RvX2NhbGxiYWNrKzB4NDAvMHg0MApbwqDCoCAxNy4xODEyOTNdwqAgPyBkbV9rY29w
eWRfY2xpZW50X2Rlc3Ryb3krMHgxNDAvMHgxNDAKW8KgwqAgMTcuMTgxNzE5XcKgIHByb2Nlc3Nf
am9icysweDgyLzB4MWIwClvCoMKgIDE3LjE4MjE0N13CoCBkb193b3JrKzB4YjkvMHhmMApbwqDC
oCAxNy4xODI1NzBdwqAgcHJvY2Vzc19vbmVfd29yaysweDFiYS8weDNkMApbwqDCoCAxNy4xODI5
OTJdwqAgd29ya2VyX3RocmVhZCsweDRkLzB4M2QwClvCoMKgIDE3LjE4MzQ0MV3CoCA/IHByb2Nl
c3Nfb25lX3dvcmsrMHgzZDAvMHgzZDAKW8KgwqAgMTcuMTgzODU3XcKgIGt0aHJlYWQrMHgxMTcv
MHgxMzAKW8KgwqAgMTcuMTg0MjcwXcKgID8ga3RocmVhZF9jcmVhdGVfd29ya2VyX29uX2NwdSsw
eDcwLzB4NzAKW8KgwqAgMTcuMTg0NjgwXcKgIHJldF9mcm9tX2ZvcmsrMHgzNS8weDQwClvCoMKg
IDE3LjE4NTA4Ml0gLS0tWyBlbmQgdHJhY2UgZjAxYzZiN2E1MDFmYWE2NCBdLS0tCgpCZXN0IHJl
Z2FyZHMsCgpEbWl0cmlqIEd1c2V2CgoKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2
ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0t
ZGV2ZWw=
